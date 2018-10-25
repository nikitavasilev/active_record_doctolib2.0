class CreateDoctorsSpecialities < ActiveRecord::Migration[5.2]
  def change
    create_table :doctors_specialities, id: false do |t|
      t.belongs_to :doctor, index: true
      t.belongs_to :speciality, index: true
    end
  end
end
