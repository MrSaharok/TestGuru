# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)
bob = User.create!(first_name: 'John', email: 'bob@gmail.com')

lama = User.create!(first_name: 'Daniel', email: 'lama@mail.ru')

categories = Category.create!([
                                { title: 'Frontend' },
                                { title: 'Backend' },
                                { title: 'Mobile' }
                              ])

tests = Test.create!([
                       { title: 'Ruby', level: 2, category: categories[1], author: bob },
                       { title: 'HTML', level: 1, category: categories[0], author: bob },
                       { title: 'JS', level: 3, category: categories[1], author: lama },
                       { title: 'Go', level: 3, category: categories[2], author: lama }
                     ])

questions = Question.create!([
                               { body: '�� ᮧ��⥫� �㡨?', test: tests[0] },
                               { body: '�� ࠧࠡ�⠫ HTML?', test: tests[1] },
                               { body: '�� �᭮��⥫� JS?', test: tests[2] },
                               { body: '� ����� ���� ��砫��� ࠧࠡ�⪠ Go?', test: tests[3] }
                             ])

answers = Answer.create!([
                           { body: 'Matz', correct: true, question: questions[0] },
                           { body: 'Mirakami', correct: false, question: questions[0] },
                           { body: '��� ��୥��-�� ', correct: true, question: questions[1] },
                           { body: '��� ���⮭', correct: false, question: questions[1] },
                           { body: '�७��� ���', correct: true, question: questions[2] },
                           { body: '��म� �ਬ��', correct: false, question: questions[2] },
                           { body: '2007', correct: true, question: questions[3] },
                           { body: '1999', correct: false, question: questions[3] }
                         ])
test_passings = TestPassing.create!([
                                      { user: bob, test: Ruby, status: 'Not finished'},
                                      { user: lama, test: JS, status: 'Not finished'},
                                      { user: lama, test: Ruby, status: 'Finished'}
                                     ])
