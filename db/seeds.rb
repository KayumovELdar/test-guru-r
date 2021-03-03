return if Category.exists?

users = User.create!([
                       { first_name: 'Eldar', last_name: 'Ka', email: 'eldar@email.ru', password: 'qwe123',
                         type: 'Admin' },
                       { first_name: 'User1', last_name: 'Ka', email: 'user1@email.ru', password: 'qwe123' }
                     ])

categories = Category.create!([
                                { name: 'Категория_1' },
                                { name: 'Категория_2' }
                              ])

tests = Test.create!([
                       { name: 'Ruby', category: categories[0], author: users[0], level: 1 },
                       { name: 'GO', category: categories[1], author: users[0], level: 2 },
                       { name: 'JS', category: categories[1], author: users[0], level: 3 }
                     ])

questions = Question.create!([
                               { text: 'Кто создал ruby?', test: tests[0] },
                               { text: 'В какой компании зародился Go?', test: tests[1] },
                               { text: 'Нажми ДА!', test: tests[2] }
                             ])

answers = Answer.create!([
                           { text: 'Он сам появился, на все воля божья!!!!', question: questions[0] },
                           { text: 'Юкихито Мацумото', correct: true, question: questions[0] },
                           { text: 'Николя Фламель', question: questions[0] },
                           { text: 'Яндекс', correct: false, question: questions[1] },
                           { text: 'Google', correct: true, question: questions[1] },
                           { text: 'ДА!', correct: true, question: questions[2] },
                           { text: 'НЕТ!', correct: false, question: questions[2] }
                         ])
badges = Badge.create!([
  {name: 'man1', image: '1.jpg', rule: 'level', option: '1'},
  {name: 'man2', image: '2.jpg', rule: 'category', option: '2'}
  ])
