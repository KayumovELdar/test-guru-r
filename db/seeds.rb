# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
unless Test.exists?
  categories = Category.create!([
    {title: "Category1"},
    {title: "Category2"}
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
    {title: "Question1_1", test: tests[0]},
    {title: "Question2_1", test_id: tests[1]},
    {title: "Question3_1", test_id: tests[2]}
  ])

  Answer.create!([
    {title: "Answer1_t", question_id: questions[0],correst: true},
    {title: "Answer1_f", question_id: questions[0],correst: false},
    {title: "Answer2_t", question_id: questions[1],correst: true},
    {title: "Answer2_f", question_id: questions[1],correst: false},
    {title: "Answer3_t", question_id: questions[2],correst: true},
    {title: "Answer3_f", question_id: questions[2],correst: false}
  ])

  UserTest.create!([
    {user: users[0], test: tests[0]},
    {user: users[0], test: tests[1]},
    {user: users[0], test: tests[2]}
  ])
end
