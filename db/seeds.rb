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
    {title: "Test1", category_id: categories[0].id, author_id: users[0].id},
    {title: "Test2", category_id: categories[1].id, author_id: users[1].id},
    {title: "Test3", category_id: categories[0].id, author_id: users[1].id}
  ])

  questions = Question.create!([
    {title: "Question1_1", test_id: tests[0].id},
    {title: "Question2_1", test_id: tests[1].id},
    {title: "Question3_1", test_id: tests[2].id}
  ])

  Answer.create!([
    {title: "Answer1_t", question_id: questions[0].id,correst: true},
    {title: "Answer1_f", question_id: questions[0].id,correst: false},
    {title: "Answer2_t", question_id: questions[1].id,correst: true},
    {title: "Answer2_f", question_id: questions[1].id,correst: false},
    {title: "Answer3_t", question_id: questions[2].id,correst: true},
    {title: "Answer3_f", question_id: questions[2].id,correst: false}
  ])

  BaseUserTest.create!([
    {user_id: users[0].id, test_id: tests[0].id},
    {user_id: users[0].id, test_id: tests[1].id},
    {user_id: users[0].id, test_id: tests[2].id}
  ])
end
