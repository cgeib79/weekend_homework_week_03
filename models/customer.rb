require_relative("../db/sql_runner")

class Customer

  attr_reader :id
  attr_accessor :customer_name, :customer_funds

  def initialize(options)
    @id = options['id'].to_i if options['id']
    @customer_name = options['customer_name']
    @customer_funds = options['customer_funds']
  end

  def save()
    sql = "INSERT INTO customers
    (
      customer_name,
      customer_funds
    )
    VALUES($1, $2)
    RETURNING id"

    values = [@customer_name, @customer_funds]
    customer = SqlRunner.run( sql, values ).first
    @id = customer['id'].to_i
  end

  def films()
    sql = "SELECT films.* FROM films INNER JOIN tickets ON films.id = tickets.film_id WHERE tickets.customer_id =$1"
    values = [@id]
    films = SqlRunner.run(sql, values)
    return films.map {|result| Film.new(result)}
  end

  

  def self.all()
    sql = "SELECT * FROM customers"
    values = []
    customers = SqlRunner.run(sql, values)
    result = customers.map{|customer| Customer.new(customer)}
  end

  def self.delete_all()
    sql = "DELETE FROM customers"
    values = []
    SqlRunner.run(sql, values)
  end

end
