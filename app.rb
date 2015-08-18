require('sinatra')
require('sinatra/reloader')
also_reload('lib/**/*.rb')
require('./lib/Doctors')
require('./lib/Patients')
require('pg')
require('pry')

DB = PG.connect({:dbname => "doctors_office_test"})

get('/') do
  erb(:index)
end

get('/add_doctor') do
  @doctors = Doctor.all()
  erb(:doctor)
end

get('/add_patient') do
  erb(:patient)
end

post('/add_doctor') do
  @name = params.fetch('name')
  @specialty = params.fetch('specialty')
  @doctor = Doctor.new({:name => @name, :specialty => @specialty, :id => nil})
  @doctor.save()
  @doctors = Doctor.all()
  erb(:doctor)
end

get('/patient/:id') do
  @id = params.fetch("id").to_i()
  @doctor= Doctor.find(@id)
  # @doctor.each do |doctor|
  #  @doctorname = doctor.name
  # end
  erb(:patient)
end

post('/add_patient') do
  @doctor_id = params.fetch('doctor_id').to_i()
  @name = params.fetch('name')
  @birthdate = params.fetch('birthdate')
  #@id = params.fetch("id").to_i()
  @doctor= Doctor.find(@doctor_id)
  new_patient = Patient.new({:id => nil,:name => @name, :doctor_id => @doctor_id, :birthdate => @birthdate})
  new_patient.save() #saves to database
  @doctor.add_patient(new_patient)
  @patients = @doctor.patients()
  erb(:doctor)
end

#QUERY: DB.exec("SELECT * FROM doctors WHERE id = <%= doctor.id %>;")
