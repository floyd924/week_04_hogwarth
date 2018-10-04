require_relative('../models/student.rb')
require_relative('../models/house.rb')
require ('pry')

Student.delete_all()
House.delete_all()
house1 = House.new({
  'name' => 'Griffindor'
  })

house2 = House.new({
  'name' => 'Slytherin'
  })

house3 = House.new({
  'name' => 'Hufflepuff'
  })

house4 = House.new({
  'name' => 'Ravenclaw'
  })

house1.save()
house2.save()
house3.save()
house4.save()

student1 = Student.new({
  'first_name' => 'Kris',
  'last_name' => 'Mak',
  'house_id' => house1.id,
  'age' => 19
  })

student2 = Student.new({
  'first_name' => 'Thomas',
  'last_name' => 'Gracie',
  'house_id' => house2.id,
  'age' => 31
  })

student3 = Student.new({
  'first_name' => 'Jackie',
  'last_name' => 'Ferr',
  'house_id' => house3.id,
  'age' => 28
  })

student4 = Student.new({
  'first_name' => 'Nathan',
  'last_name' => 'Noodle',
  'house_id' => house4.id,
  'age' => 23
  })

student1.save
student2.save
student3.save
student4.save




# p Student.find(5)

binding.pry
nil
