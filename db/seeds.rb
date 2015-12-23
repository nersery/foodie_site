# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

category = ["Korean","Japanese","Chinese","Western"]

category.each do |cat|
  for x in 1..2
    p = Post.new
    p.title = "#{cat} #{x}"
    p.category = cat
    p.content = "#{cat} #{x} cuisine"
    p.valuation = 4.3
    p.budget = 1250
    p.save
  end
end
