bob = User.create!(name: 'Bob', email: 'bob@gmail.com')

lama = User.create!(name: 'Lama', email: 'lama@mail.ru')

categories = Category.create!([
                                { title: 'Frontend' },
                                { title: 'Backend' },
                                { title: 'Mobile' }
                              ])

tests = Test.create!([
                       { title: 'Ruby', level: 2, category: categories[1], author: bob },
                       { title: 'HTML', level: 2, category: categories[0], author: bob },
                       { title: 'JS', level: 3, category: categories[1], author: lama },
                       { title: 'Go', level: 3, category: categories[2], author: lama }
                     ])

questions = Question.create!([
                               { body: 'Who is the creator of Ruby?', test: tests[0] },
                               { body: 'Year of release ruby?', test: tests[0] },
                               { body: 'Is everything in ruby an object?', test: tests[0] },
                               { body: 'Who developed HTML?', test: tests[1] },
                               { body: 'Year of development HTML?', test: tests[1] },
                               { body: 'HTML the tag markup language of documents?', test: tests[1] },
                               { body: 'Who is the founder of JS?', test: tests[2] },
                               { body: 'Year of development JS?', test_id: tests[2] },
                               { body: 'full name JS?', test: tests[2] },
                               { body: 'In what year did Go development start?', test: tests[3] }
                             ])

answers = Answer.create!([
                           { body: 'Matz', correct: true, question: questions[0] },
                           { body: 'Matiz', question: questions[0] },
                           { body: 'Motsumoto', question: questions[0] },
                           { body: '1999', question: questions[0] },
                           { body: '1995', correct: true, question: questions[0] },
                           { body: '2000', question: questions[0] },
                           { body: 'Yes', question: questions[0] },
                           { body: 'No', correct: true, question: questions[0] },
                           { body: 'Maybe no', question: questions[0] },
                           { body: 'Tim Berton', question: questions[1] },
                           { body: 'Tim Berners-Lee', correct: true, question: questions[1] },
                           { body: 'Bruce Lee', question: questions[1] },
                           { body: '1985', question: questions[1] },
                           { body: '1990', question: questions[1] },
                           { body: '1993', correct: true, question: questions[1] },
                           { body: 'No way', question: questions[1] },
                           { body: 'No', question: questions[1] },
                           { body: 'Yes', correct: true, question: questions[1] },
                           { body: 'Benedict', question: questions[2] },
                           { body: 'Branch', question: questions[2] },
                           { body: 'Brendan Eich', correct: true, question: questions[2] },
                           { body: '1980', question: questions[2] },
                           { body: '1995', correct: true, question: questions[2] },
                           { body: '2004', question: questions[2] },
                           { body: 'Java Script', correct: true, question: questions[2] },
                           { body: 'Jon Spock', question: questions[2] },
                           { body: 'J7', question: questions[2] },
                           { body: '2008', question: questions[3] },
                           { body: '2006', question: questions[3] },
                           { body: '2007', correct: true, question: questions[3] }
                         ])

test_passings = TestPassing.create!([
                                      { user: bob, test: tests[0], current_question: questions[0] },
                                      { user: bob, test: tests[1], current_question: questions[1] },
                                      { user: lama, test: tests[2], current_question: questions[2] },
                                      { user: lama, test: tests[0], current_question: questions[0] }
                                    ])
