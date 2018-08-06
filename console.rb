require_relative( 'models/ticket' )
require_relative( 'models/customer' )
require_relative( 'models/film' )

require( 'pry-byebug' )

Film.delete_all()
Customer.delete_all()
Ticket.delete_all()

film1 = Film.new({'film_title' => 'Avengers: Infinity War', 'film_price' => 10})
film1.save()
film2 = Film.new({'film_title' => 'Solo: A Star Wars Story', 'film_price' => 2})
film2.save()
film3 = Film.new({'film_title' => 'Superman Returns', 'film_price' => 8})
film3.save()

customer1 = Customer.new({'customer_name' => 'Gareth Williams', 'customer_funds' => 10})
customer1.save()
customer2 = Customer.new({'customer_name' => 'Barry Smith', 'customer_funds' => 8})
customer2.save()
customer3 = Customer.new({'customer_name' => 'Bonamy Grimes', 'customer_funds' => 5})
customer3.save()

ticket1 = Ticket.new({'film_id' => film1.id, 'customer_id' => customer1.id })
ticket1.save()
ticket2 = Ticket.new({'film_id' => film2.id, 'customer_id' => customer2.id})
ticket2.save()
ticket3 = Ticket.new({'film_id' => film3.id, 'customer_id' => customer3.id})
ticket3.save()

binding.pry
nil
