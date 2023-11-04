# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)


if Rails.env.development?
  user = User.find_or_create_by(email: "admin@gmail.com")
  survey = Survey.find_or_create_by(name: "Subscription survey", survey_type: Survey.survey_types[:subscription], user: user)
  Question.find_or_create_by(name: "Fav color?", survey: survey, position: 1)
  Question.find_or_create_by(name: "Fav brand?", survey: survey, position: 2)
  Question.find_or_create_by(name: "City?", survey: survey, position: 3)
  Question.find_or_create_by(name: "Fav season?", survey: survey, position: 4)
end
