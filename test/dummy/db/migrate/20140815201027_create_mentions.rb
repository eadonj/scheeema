class CreateMentions < ActiveRecord::Migration
  def change
    create_table :mentions do |t|
      t.string :source_title
      t.string :author
      t.string :published_at
      t.integer :paradigm_id

      t.timestamps
    end
    add_index :mentions, :paradigm_id
  end
end
