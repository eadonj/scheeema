class CreateFeatheredQuills < ActiveRecord::Migration
  def change
    create_table :feathered_quills do |t|
      t.string   :feather_type
      t.integer  :age
      t.timestamps
    end
  end
end
