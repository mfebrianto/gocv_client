class CreateEducations < ActiveRecord::Migration
  def change
    create_table :educations do |t|
      t.string :school_name
      t.string :city
      t.string :country
      t.datetime :start
      t.datetime :end
      t.string :faculty
      t.string :client_id
      t.timestamps
    end
  end
end
