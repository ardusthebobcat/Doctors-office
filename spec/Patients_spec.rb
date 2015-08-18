require('spec_helper')
require('Patients')

describe(Patient) do
  describe('#name') do
    it('returns the name of the patient') do
      test_patient = Patient.new({:id => nil, :name => "Bugs Bunny", :birthdate=>'1980-02-03', :doctor_id => nil})
      expect(test_patient.name).to eq("Bugs Bunny")
    end
  end
  describe('#==') do
    it('is the same patient if it has the same properties') do
      patient1 = Patient.new({:id => nil, :name => "Bugs Bunny", :birthdate=>'1980-02-03', :doctor_id => nil})
      patient2 = Patient.new({:id => nil, :name => "Bugs Bunny", :birthdate=>'1980-02-03', :doctor_id => nil})
      expect(patient1).to eq(patient2)
    end
  end
  describe('.all') do
    it('Returns empty array currently') do
      expect(Patient.all()).to eq([])
    end
  end
  describe('#save') do
    it('adds a patient to the patient database') do
      patient1 = Patient.new({:id => nil, :name => "Bugs Bunny", :birthdate=>'1980-02-03 00:00:00', :doctor_id => 1})
      patient1.save()
      expect(Patient.all()).to eq([patient1])
    end
  end
  describe('#doctor_id') do
    it('returns doctor_id') do
      patient1 = Patient.new({:id => nil, :name => "Bugs Bunny", :birthdate=>'1980-02-03', :doctor_id => 1})
      expect(patient1.doctor_id).to eq(1)
    end
  end
end
