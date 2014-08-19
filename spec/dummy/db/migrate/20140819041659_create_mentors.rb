class CreateMentors < ActiveRecord::Migration
  def change
    change_table :philosophers do |t|
      t.references :mentor
    end

    add_index :philosophers, :mentor_id
  end
end
