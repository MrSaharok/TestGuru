
bob = User.find_or_create_by!(name: 'Bob', email: 'bob@gmail.com')

lama = User.find_or_create_by!(name: 'Lama', email: 'lama@mail.ru')

categories = Category.find_or_create_by!([
                                          { title: 'Frontend' },
                                          { title: 'Backend' },
                                          { title: 'Mobile' }
                                         ])

tests = Test.find_or_create_by!([
                                  { title: 'Ruby', level: 2, category_id: categories[1].id, author_id: bob.id },
                                  { title: 'HTML', level: 2, category_id: categories[0].id, author_id: bob.id },
                                  { title: 'JS', level: 3, category_id: categories[1].id, author_id: lama.id },
                                  { title: 'Go', level: 3, category_id: categories[2].id, author_id: lama.id }
                                ])

questions = Question.find_or_create_by!([
                                          { body: 'Who is the creator of Ruby?', test_id: tests[0].id },
                                          { body: 'Who developed HTML?', test_id: tests[1].id },
                                          { body: 'Who is the founder of JS?', test_id: tests[2].id },
                                          { body: 'In what year did Go development start?', test_id: tests[3].id }
                                        ])

answers = Answer.find_or_create_by!([
                                      { body: 'Matz', correct: true, question_id: questions[0].id },
                                      { body: 'Tim Berners-Lee', correct: true, question_id: questions[1].id },
                                      { body: 'Brendan Eich', correct: true, question_id: questions[2].id },
                                      { body: '2007', correct: true, question_id: questions[3].id }
                                    ])

test_passings = TestPassing.find_or_create_by!([
                                                 { user_id: bob.id, test_id: tests[0].id,
                                                   current_question_id: questions[0].id, status: 'Not finished'},
                                                 { user_id: bob.id, test_id: tests[1].id,
                                                   current_question_id: questions[1].id, status: 'Finished'},
                                                 { user_id: lama.id, test_id: tests[2].id,
                                                   current_question_id: questions[2].id, status: 'Not finished'},
                                                 { user_id: lama.id, test_id: tests[0].id,
                                                   current_question_id: questions[0].id, status: 'Finished'}
                                               ])
