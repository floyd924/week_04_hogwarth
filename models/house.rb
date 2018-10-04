require_relative('../db/sql_runner.rb')

class House

  attr_reader :id
  attr_accessor :name

  def initialize(options)
    @id = options['id'].to_i if options['id']
    @name = options['name']
  end

  def save()
    sql = "
    INSERT INTO houses(name)
    VALUES ($1)
    RETURNING id;
    "
    values = [@name]
    house = SqlRunner.run(sql, values)[0]
    @id = house['id'].to_i
  end

  def self.delete_all
    sql = "
    DELETE from houses;"
    SqlRunner.run(sql)
  end

  def self.all()
    sql = "
    SELECT * FROM houses;"
    result_hashes = SqlRunner.run(sql)
    array_objects = result_hashes.map do |house| House.new(house)
  end
  return array_objects
  end

  def self.find(id)
    sql = "
    SELECT * FROM houses WHERE id = $1;"
    values = [id]
    house = SqlRunner.run(sql, values)[0]
    object = House.new(house)
    return object

  end

end
