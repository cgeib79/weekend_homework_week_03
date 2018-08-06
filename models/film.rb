require_relative("../db/sql_runner")
class Film

  attr_reader :id
  attr_accessor :film_title, :film_price

  def initialize(options)
    @id = options['id'].to_i if options['id']
    @film_title = options['film_title']
    @film_price = options['film_price'].to_i
  end

  def save()

    sql = "INSERT INTO films
    (
      film_title,
      film_price
    )
    VALUES
    (
      $1, $2
    )
    RETURNING id"
    values = [@film_title, @film_price]
    film = SqlRunner.run(sql, values).first
    @id = film['id'].to_i
  end

  def customers()
    sql = "SELECT customers.* FROM customers INNER JOIN tickets ON customers.id = tickets.customer_id WHERE tickets.film_id = $1"
    values =[@id]
    customers = SqlRunner.run(sql, values)
    return customers.map {|result| Customer.new(result)}
  end

  def self.all()
    sql = "SELECT * FROM films"
    values = []
    films = SqlRunner.run(sql, values)
    result = films.map {|film| Film.new(film)}
    return result
  end


  def self.delete_all()
    sql = "DELETE FROM films"
    values = []
    SqlRunner.run(sql, values)
  end

end
