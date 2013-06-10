class User < ActiveRecord::Base
  attr_accessible :name, :email, :password, :nickname, :thumb, :explain, :delflg
end
