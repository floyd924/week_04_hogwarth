require('sinatra')
require('sinatra/contrib/all')
require('pry-byebug')
require_relative( 'models/student.rb')
also_reload( './models/*')

#index route
get("/students") do
  @students = Student.all()
  erb(:index)
end

#get new
get("/students/new") do
  erb(:new)
end

post('/students') do
  @student = Student.new(params)
  @student.save()
  erb(:create)
end

# get("/students/houses") do
#   @houses = House.all()
#   erb(:house_index)
# end
