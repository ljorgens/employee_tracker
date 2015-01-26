require("spec_helper")

it("tells which employees are in it") do
  division = Division.create({:name => "Marketing"})
  employee1 = Employee.create({:name => "swanson", :division_id => division.id})
  employee2 = Employee.create({:name => "steve", :division_id => division.id})
  expect(division.employees()).to(eq([employee1, employee2]))
end
end
