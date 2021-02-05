# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
unless Test.exists?
  users = User.create!([
                         {name: 'Eldar'},
                         {name: 'User_1'}
                     ])

  categories = Category.create!([
                                    {name: 'Категория_1'},
                                    {name: 'Категория_2'},
                                ])

  tests = Test.create!([
                           {name: "Ruby", category: categories[0], author: users[0], level: 1},
                           {name: "GO", category: categories[1], author: users[0], level: 2},
                           {name: "JS", category: categories[1], author: users[0], level: 3}
                       ])

  questions = Question.create!([
                                   {text: 'Кто создал ruby?', test: tests[0]},
                                   {text: 'В какой компании зародился Go?', test: tests[1]},
                                   {text: 'Нажми ДА!', test: tests[2]},
                               ])

  answers = Answer.create!([
                               {text: 'Он сам появился, на все воля божья!!!!', correct: true, question: questions[0]},
                               {text: 'Юкихито Мацумото', correct: false, question: questions[0]},
                               {text: 'Николя Фламель', correct: false, question: questions[0]},
                               {text: 'Яндекс', correct: false, question: questions[1]},
                               {text: 'Google', correct: true, question: questions[1]},
                               {text: 'ДА!', correct: false, question: questions[2]},
                               {text: 'НЕТ!', correct: true, question: questions[2]},
                           ])

  passed_tests = User_test.create!([
                                        {user: users[0], test: tests[0]},
                                        {user: users[0], test: tests[1]},
                                        {user: users[0], test: tests[2]},
                                    ])
end
