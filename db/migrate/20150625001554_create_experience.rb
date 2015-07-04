class CreateExperience < ActiveRecord::Migration
  def change
    create_table :experiences do |t|
      t.string :client_id
      t.string :company_name
      t.string :position
      t.datetime :started_on
      t.datetime :ended_on
      t.boolean :current_job
      t.timestamps
    end
  end
end
