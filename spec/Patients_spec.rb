require('spec_helper')
require('Patients')

describe(Patient) do
  describe('#name') do
    it('returns the name of the patient') do
      test_patient = Patient.new({:id => nil, :name => "Bugs Bunny", :birthday=>'1980-02-03', :doctor_id => nil})
      expect(test_patient.name).to eq("Bugs Bunny")
    end
  end
end
