# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

user = User.create(
      name: 'sample',
      email: 'hoge_portfolio@gmail.com',
      password: '',
      nickname: 'サンプル',
      thumb: '',
      explain: 'サンプルユーザー',
  )
