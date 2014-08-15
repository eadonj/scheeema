class CreateParadigms < ActiveRecord::Migration
  def change
    create_table :paradigms do |t|
      t.string :pattern
      t.integer :exemplar_id
      t.string :archetype
      t.string :prototype
      t.string :example
      t.boolean :common
      t.datetime :discovered_at
      t.integer :quantity
      t.datetime :nullified_at
      t.integer :era_id

      t.timestamps
    end
    add_index :paradigms, :exemplar_id
    add_index :paradigms, :era_id    
  end
end
