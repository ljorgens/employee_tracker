require("sinatra")
require("sinatra/reloader")
also_reload("lib/**/*.rb")
require("sinatra/activerecord")
require("./lib/division")
require("./lib/employee")
require("pg")

get("/") do
  @divisions = Division.all()
  erb(:index)
end

post("/divisions") do
  name = params.fetch("name")
  @division = Division.new({:name => name})
  @division.save()
  @divisions = Division.all()
  erb(:index)
end

get("/divisions/:id") do
  @division = Division.find(params.fetch("id").to_i())
  erb(:division)
end

post("/employees") do
  name = params.fetch("name")
  division_id = params.fetch("division_id")
  @employee = Employee.new({:name => name, :division_id => division_id})
  @employee.save()
  @employees = Employee.all()
  @division = Division.find(division_id)
  erb(:division)
end
