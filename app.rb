require("sinatra")
require("sinatra/reloader")
also_reload("lib/**/*.rb")
require("sinatra/activerecord")
require("./lib/employee")
require("pg")

get("/") do
  @employees = Employee.all()
  erb(:index)
end

post("/employees") do
  name = params.fetch("name")
  @employee = Employee.new({:name => name})
  @employee.save()
  @employees = Employee.all()
  erb(:index)
end

get("/divisions/:id") do

  erb(:division)
end
