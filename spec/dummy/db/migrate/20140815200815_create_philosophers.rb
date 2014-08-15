class CreatePhilosophers < ActiveRecord::Migration
  def change
    create_table :philosophers do |t|
      t.string :first_name
      t.string :last_name
      t.datetime :born_on
      t.string :country
      t.string :field_of_study

      t.timestamps
    end
  end
end
