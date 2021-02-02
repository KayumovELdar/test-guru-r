# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
unless Test.exists?
  categories = Category.create!([
    {name: "Category1"},
    {name: "Category2"}
  ])

  users = User.create!([
    {name: "User1"},
    {name: "User2"}
  ])

  tests = Test.create!([
    {name: "Test1", category: categories[0], author: users[0], level: 0},
    {name: "Test2", category: categories[1], author: users[1], level: 1},
    {name: "Test3", category: categories[0], author: users[1], level: 1}
  ])

  questions = Question.create!([
    {text: "Question1_1", test: tests[0]},
    {text: "Question2_1", test: tests[1]},
    {text: "Question3_1", test: tests[2]}
  ])

  Answer.create!([
    {text: "Answer1_t", question: questions[0],correst: true},
    {text: "Answer1_f", question: questions[0],correst: false},
    {text: "Answer2_t", question: questions[1],correst: true},
    {text: "Answer2_f", question: questions[1],correst: false},
    {text: "Answer3_t", question: questions[2],correst: true},
    {text: "Answer3_f", question: questions[2],correst: false}
  ])

  UserTest.create!([
    {user: users[0], test: tests[0]},
    {user: users[0], test: tests[1]},
    {user: users[0], test: tests[2]}
  ])
end
