require_relative('../db/sql_runner.rb')

class Student

  attr_reader :id, :age
  attr_accessor :first_name, :last_name, :house_id

  def initialize(options)
    @id = options['id'].to_i if options['id']
    @first_name = options['first_name']
    @last_name = options['last_name']
    @house_id = options['house_id']
    @age = options['age'].to_i
  end


  def save()
    sql = "
    INSERT INTO students(first_name, last_name, house_id, age)
    VALUES ($1, $2, $3, $4)
    RETURNING id;
    "
    values = [@first_name, @last_name, @house_id, @age]
    student = SqlRunner.run(sql, values)[0]
    @id = student['id'].to_i
  end

  def self.delete_all
    sql = "
    DELETE from students;"
    SqlRunner.run(sql)
  end

  def self.all()
    sql = "
    SELECT * FROM students;"
    result_hashes = SqlRunner.run(sql)
    array_objects = result_hashes.map do |student| Student.new(student)
  end
  return array_objects
  end

  def self.find(id)
    sql = "
    SELECT * FROM students WHERE id = $1;"
    values = [id]
    student = SqlRunner.run(sql, values)[0]
    object = Student.new(student)
    return object

  end

end
