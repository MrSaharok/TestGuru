bob = User.create!(name: 'Bob', email: 'bob@gmail.com')

lama = User.create!(name: 'Lama', email: 'lama@mail.ru')

categories = Category.create!([
                                { title: 'Frontend' },
                                { title: 'Backend' },
                                { title: 'Mobile' }
                              ])

tests = Test.create!([
                       { title: 'Ruby', level: 2, category_id: categories[1].id, author_id: bob.id },
                       { title: 'HTML', level: 2, category_id: categories[0].id, author_id: bob.id },
                       { title: 'JS', level: 3, category_id: categories[1].id, author_id: lama.id },
                       { title: 'Go', level: 3, category_id: categories[2].id, author_id: lama.id }
                     ])

questions = Question.create!([
                               { body: 'Who is the creator of Ruby?', test_id: tests[0].id },
                               { body: 'Year of release ruby?', test_id: tests[0].id },
                               { body: 'Is everything in ruby an object?', test_id: tests[0].id },
                               { body: 'Who developed HTML?', test_id: tests[1].id },
                               { body: 'Year of development HTML?', test_id: tests[1].id },
                               { body: 'HTML the tag markup language of documents?', test_id: tests[1].id },
                               { body: 'Who is the founder of JS?', test_id: tests[2].id },
                               { body: 'Year of development JS?', test_id: tests[2].id },
                               { body: 'full name JS?', test_id: tests[2].id },
                               { body: 'In what year did Go development start?', test_id: tests[3].id }
                             ])

answers = Answer.create!([
                           { body: 'Matz', correct: true, question_id: questions[0].id },
                           { body: 'Matiz', question_id: questions[0].id },
                           { body: 'Motsumoto', question_id: questions[0].id },
                           { body: '1999', question_id: questions[0].id },
                           { body: '1995', correct: true, question_id: questions[0].id },
                           { body: '2000', question_id: questions[0].id },
                           { body: 'Yes', question_id: questions[0].id },
                           { body: 'No', correct: true, question_id: questions[0].id },
                           { body: 'Maybe no', question_id: questions[0].id },
                           { body: 'Tim Berton', question_id: questions[1].id },
                           { body: 'Tim Berners-Lee', correct: true, question_id: questions[1].id },
                           { body: 'Bruce Lee', question_id: questions[1].id },
                           { body: '1985', question_id: questions[1].id },
                           { body: '1990', question_id: questions[1].id },
                           { body: '1993', correct: true, question_id: questions[1].id },
                           { body: 'No way', question_id: questions[1].id },
                           { body: 'No', question_id: questions[1].id },
                           { body: 'Yes', correct: true, question_id: questions[1].id },
                           { body: 'Benedict', question_id: questions[2].id },
                           { body: 'Branch', question_id: questions[2].id },
                           { body: 'Brendan Eich', correct: true, question_id: questions[2].id },
                           { body: '1980', question_id: questions[2].id },
                           { body: '1995', correct: true, question_id: questions[2].id },
                           { body: '2004', question_id: questions[2].id },
                           { body: 'Java Script', correct: true, question_id: questions[2].id },
                           { body: 'Jon Spock', question_id: questions[2].id },
                           { body: 'J7', question_id: questions[2].id },
                           { body: '2008', question_id: questions[3].id },
                           { body: '2006', question_id: questions[3].id },
                           { body: '2007', correct: true, question_id: questions[3].id }
                         ])

test_passings = TestPassing.create!([
                                      { user_id: bob.id, test_id: tests[0].id,
                                        current_question_id: questions[0].id, status: 'Not finished' },
                                      { user_id: bob.id, test_id: tests[1].id,
                                        current_question_id: questions[1].id, status: 'Finished' },
                                      { user_id: lama.id, test_id: tests[2].id,
                                        current_question_id: questions[2].id, status: 'Not finished' },
                                      { user_id: lama.id, test_id: tests[0].id,
                                        current_question_id: questions[0].id, status: 'Finished' }
                                    ])
