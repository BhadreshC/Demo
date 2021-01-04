class CreateAppointments < ActiveRecord::Migration[6.0]
  def change
    create_table :appointments do |t|
      t.string :name
      t.belongs_to :patient, index: true
      t.belongs_to :physician, index: true
      t.datetime :appointment_date
      t.timestamps
    end
  end
end
