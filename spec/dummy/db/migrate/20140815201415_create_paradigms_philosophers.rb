class CreateParadigmsPhilosophers < ActiveRecord::Migration
  def change
    create_table :paradigms_philosophers, id: false do |t|
      t.integer :paradigm_id
      t.integer :philosopher_id
    end
    add_index :paradigms_philosophers, :paradigm_id
    add_index :paradigms_philosophers, :philosopher_id
  end
end