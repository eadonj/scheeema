class CreateApprenticeships < ActiveRecord::Migration
  def change
    create_table :apprenticeships do |t|
      t.integer :student_id
      t.string :philosopher_id
      t.string :name

      t.timestamps
    end
    add_index :apprenticeships, :student_id
    add_index :apprenticeships, :philosopher_id
  end
end
