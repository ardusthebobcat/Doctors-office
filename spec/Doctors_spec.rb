require('spec_helper')
require('Doctors')

describe(Doctor) do
  describe('#name') do
    it('returns the name') do
      test_doctor = Doctor.new({:name => 'Bob', :specialty => 'Orthopedics', :id => nil})
      expect(test_doctor.name()).to eq('Bob')
    end
  end

  describe('#==') do
    it('is the same doctor if it has the same properties') do
      doctor1 = Doctor.new({:name => 'Bob', :specialty => 'Orthopedics', :id => nil})
      doctor2 = Doctor.new({:name => 'Jim', :specialty => 'Pediatrics', :id => nil})
    end
  end

  describe('#specialty') do
    it('returns the specialty of the doctor') do
      test_doctor = Doctor.new({:name => 'Doctor Scholes', :specialty => 'Orthopedics', :id => nil})
      expect(test_doctor.specialty()).to eq('Orthopedics')
    end
  end

  describe('.all') do
    it('returns the saved list of doctors') do
      expect(Doctor.all).to eq([])
    end
  end

  describe('#save') do
    it('tests save method') do
      test_doctor = Doctor.new({:name => 'Doctor Scholes', :specialty => 'Orthopedics', :id => nil})
      test_doctor.save()
      expect(Doctor.all).to eq([test_doctor])
    end
  end
end
