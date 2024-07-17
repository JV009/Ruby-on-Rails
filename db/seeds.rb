categories = Category.create([{title: 'Ruby'},
                              {title: 'Rails'}])

users = User.create([{name: 'Alexander Popov', email: 'popov@gmail.com'},
                     {name: 'Dima Puchkov', email: 'goblin@gmail.com'},
                     {name: 'Klim Zukov', email: 'u_zukova@gmail.com'}])

tests = Test.create([{title: 'Basic Ruby', level: 0, author_id: users[0].id, category_id: categories[0].id,},
                     {title: 'Basic Rails', level: 0, author_id: users[1].id, category_id: categories[1].id},
                     {title: 'Advanced Ruby', level: 1, author_id: users[2].id, category_id: categories[0].id},
                     {title: 'Advanced Rails', level: 1, author_id: users[2].id, category_id: categories[1].id}])

questions = Question.create([{body: 'When was Ruby created?', test_id: tests[0].id},
                             {body: 'When was rails created?', test_id: tests[1].id},
                             {body: 'What is the main idea of Ruby?', test_id: tests[2].id},
                             {body: 'What websites are built on Ruby on Rails?', test_id: tests[3].id}])

answers = Answer.create([{body: '1995',correct: true, question_id: questions[0].id},
                         {body: '2005',correct: false, question_id: questions[0].id},
                         {body: '2015',correct: false, question_id: questions[1].id},
                         {body: '2005',correct: true, question_id: questions[1].id},
                         {body: 'A dynamic programming language with an emphasis on simplicity and clarity for developers',correct: true, question_id: questions[2].id},
                         {body: 'Static programming language with an emphasis on speed of program execution',correct: false, question_id: questions[2].id},
                         {body: 'GitHub, Twitter, twich, Codecademy',correct: true, question_id: questions[3].id},
                         {body: 'Spotify, Google, Instgram, reddit',correct: false, question_id: questions[3].id}])
