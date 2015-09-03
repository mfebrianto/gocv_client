class CreateScratch < ActiveRecord::Migration
  def change
    create_table :scratches do |t|
      t.string :client_id
      t.timestamps
    end
  end
end
