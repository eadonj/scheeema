class CreateEsotericToolSets < ActiveRecord::Migration
  def change
    create_table :esoteric_tool_sets do |t|
      t.references :feathered_quill
      t.references :philosopher
      t.timestamps
    end

    add_index :esoteric_tool_sets, :feathered_quill_id  
    add_index :esoteric_tool_sets, :philosopher_id
  end
end
