application = 'portfolio'

listen "/tmp/unicorn_#{application}.sock"
pid "/tmp/unicorn_#{application}.pid"

worker_processes 2;

timeout 30
preload_app true

shared_path = "/home/mrsk/htdocs_r/#{application}"
stderr_path "#{shared_path}/log/unicorn.stderr.log"
stdout_path "#{shared_path}/log/unicorn.stdout.log"

before_fork do |server, worker|
  # マスタープロセスの接続を解除
  if defined?(ActiveRecord::Base)
    #ActiveRecord::Base.connection.disconnect!
  end
  # 古いマスタープロセスをKILL
  old_pid = "/tmp/unicorn_#{application}.pid.oldbin"
  if File.exists?(old_pid) && server.pid != old_pid
    begin
      Process.kill("QUIT", File.read(old_pid).to_i)
    rescue Errno::ENOENT, Errno::ESRCH
      # someone else did our job for us
    end
  end
end

after_fork do |server, worker|
  # preload_app=trueの場合は必須
  if defined?(ActiveRecord::Base)
    #ActiveRecord::Base.establish_connection
  end
end