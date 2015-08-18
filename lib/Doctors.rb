class Doctor
  attr_reader(:id, :name, :specialty, :patients)

  define_method(:initialize) do |attributes|
    @id = attributes.fetch(:id)
    @name = attributes.fetch(:name)
    @specialty = attributes.fetch(:specialty)
    @patients = []
  end

  define_method(:==) do |another_doctor|
    self.name().==(another_doctor.name()).&self.id().==(another_doctor.id()).&self.specialty().==(another_doctor.specialty())
  end

  define_singleton_method(:all) do
    returned_doctors = DB.exec("SELECT * FROM doctors;")
    doctors = []
    returned_doctors.each() do |doctor|
      name = doctor.fetch('name')
      id = doctor.fetch('id').to_i()
      specialty = doctor.fetch('specialty')
      doctors.push(Doctor.new({:name => name, :id => id, :specialty => specialty}))
    end
    doctors
  end

  define_method(:save) do
    result = DB.exec("INSERT INTO doctors (name, specialty) VALUES ('#{@name}', '#{@specialty}') RETURNING id;")
    @id = result.first().fetch('id').to_i()
  end

  define_method(:add_patient) do |patient|
    @patients.push(patient)
  end

  define_singleton_method(:find) do |id|
    found_doctor = nil
    Doctor.all.each do |doctor|
      if doctor.id().==(id)
        found_doctor = doctor
      end
    end
    found_doctor
  end

end
