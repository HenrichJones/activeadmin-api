# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

puts "Criando Users"
User.create(username: 'Dom Lewis', email: 'domlewis@gmail.com', password: '123123123')
User.create(username: 'Martinelli Tompsom', email: 'tompsomnelli@gmail.com', password: '123123123')
User.create(username: 'Lysa Harley', email: 'lysaharley@gmail.com', password: '123123123')
puts "#{User.all.count} usuários criados"

puts "Criando Endereços"
Address.create(street: 'Denmark Loan', neigborhood: 'Wharf Grove', city: 'olympia', state: 'washington', zipcode: '57642355', user_id: 1)
Address.create(street: 'Coopers East', neigborhood: 'Miterdale', city: 'Fox Hill Drive', state: 'Foxborough', zipcode: '57642355', user_id: 2)
Address.create(street: 'New Park Cloisters', neigborhood: 'Ackhurst Lodge', city: 'Cloisters', state: 'Lodge Drive', zipcode: '57642355', user_id: 3)
puts "#{Address.all.count} endereços criados"

puts "Criando Livros"
Book.create(title: 'JavaScript: O Guia Definitivo', description: 'JavaScript é a linguagem de programação da Web', author: 'David Flanagan', price: "750.0", featured: true, avaiable_on: "2019-05-12")
Book.create(title: 'Fundamentos de HTML5 e CSS3', description: 'Maujor aborda as funcionalidades da HTML5 e das CSS3 de forma clara', author: 'Maurício Samy Silva', price: "50.0", featured: true, avaiable_on: "2019-01-12")
Book.create(title: 'Construindo aplicações com NodeJS', description: 'O que é o NodeJS e o que pode ser feito com essa plataforma', author: 'William Bruno Moraes', price: "40.0", featured: true, avaiable_on: "2019-02-12")
Book.create(title: 'Descomplicando o Docker 2a edição', description: 'Dont panic! O assunto é bem mais fácil do que parece. :)', author: ' Jeferson Fernando & Marcus André', price: "49.0", featured: false, avaiable_on: "2019-02-12")
puts "#{Book.all.count} livros criados"

puts "Criando Pedidos"
Order.create(user_id: 1, state: 0, book_ids: [1, 2], total: (Book.find(1).price.to_i + Book.find(2).price.to_i))
Order.create(user_id: 2, state: 1, book_ids: [2, 3], total: (Book.find(2).price.to_i + Book.find(3).price.to_i))
Order.create(user_id: 3, state: 0, book_ids: [3, 4], total: (Book.find(3).price.to_i + Book.find(4).price.to_i))
puts "#{Order.all.count} pedidos criados"