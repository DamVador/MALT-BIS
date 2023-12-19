# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)

require 'faker'
Faker::Config.locale = 'fr'
#User.delete_all
# Profile.delete_all
#Skill.delete_all

33.times do
    User.create!(
      email:     Faker::Internet.email,
      password:   "password",
    )
end

puts "#{User.all.count} users created"

k = 1
titles = ["Développeur fullstack", "Développeur Backend", "Développeur frontend", "Designer", "Consultant marketing", "Manager de projet", "Product manager"]
experiences = ["0-2 ans", "3-7 ans", "8 ans et +"]
categories = ["Développeur fullstack", "Développeur Backend", "Développeur frontend", "Designer", "Consultant marketing", "Manager de projet", "Product manager"]
prices = [250, 300, 350, 400, 450, 500, 550, 600, 650]
cities = ["Paris", "Lyon", "Marseille", "Nantes", "Bordeaux", "Toulouse", "Lille", "Grenoble", "Le Havre", "Tours", "Toulon", "Brest", "Clermont-Ferrand"]
33.times do
  Profile.create(
    user_id: k,
    first_name: Faker::Name.first_name,
    last_name: Faker::Name.last_name,
    title: titles.sample,
    location: cities.sample,
    price: prices.sample,
    experience: experiences.sample,
    is_remote: [true, false].sample,
    category: categories.sample
  )
  k += 1
end

puts "#{Profile.all.count} profiles created"

skills = ["HTML", "CSS", "PHP", "Laravel", "Javascript", "RubyOnRails", "Git", "SQL", "Design"]

skills.each do |s|
    Skill.create(
        name: s
    )
end

80.times do
    u = User.find(rand(User.first.id..User.last.id)).id
    s = Skill.find(rand(Skill.first.id..Skill.last.id)).id
    if UsersSkill.where('user_id', u).where('skill_id', s).empty?
        UsersSkill.create(
            user_id: u,
            skill_id: s
        )
    end
end