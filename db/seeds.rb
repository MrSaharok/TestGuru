bob = User.create!(name: 'Bob', email: 'bob@gmail.com', password: 'test')

lama = User.create!(name: 'Lama', email: 'lama@mail.ru', password: 'test')

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
                               { body: 'Year of development JS?', test: tests[2] },
                               { body: 'full name JS?', test: tests[2] },
                               { body: 'In what year did Go development start?', test: tests[3] }
                             ])

Answer.create!([
                           { body: 'Matz', correct: true, question: questions[0] },
                           { body: 'Matiz', question: questions[0] },
                           { body: 'Motsumoto', question: questions[0] },
                           { body: '1999', question: questions[1] },
                           { body: '1995', correct: true, question: questions[1] },
                           { body: '2000', question: questions[1] },
                           { body: 'Yes', question: questions[2] },
                           { body: 'No', correct: true, question: questions[2] },
                           { body: 'Maybe no', question: questions[2] },
                           { body: 'Tim Berton', question: questions[3] },
                           { body: 'Tim Berners-Lee', correct: true, question: questions[3] },
                           { body: 'Bruce Lee', question: questions[3] },
                           { body: '1985', question: questions[4] },
                           { body: '1990', question: questions[4] },
                           { body: '1993', correct: true, question: questions[4] },
                           { body: 'No way', question: questions[5] },
                           { body: 'No', question: questions[5] },
                           { body: 'Yes', correct: true, question: questions[5] },
                           { body: 'Benedict', question: questions[6] },
                           { body: 'Branch', question: questions[6] },
                           { body: 'Brendan Eich', correct: true, question: questions[6] },
                           { body: '1980', question: questions[7] },
                           { body: '1995', correct: true, question: questions[7] },
                           { body: '2004', question: questions[7] },
                           { body: 'Java Script', correct: true, question: questions[8] },
                           { body: 'Jon Spock', question: questions[8] },
                           { body: 'J7', question: questions[8] },
                           { body: '2008', question: questions[9] },
                           { body: '2006', question: questions[9] },
                           { body: '2007', correct: true, question: questions[9] }
                         ])
