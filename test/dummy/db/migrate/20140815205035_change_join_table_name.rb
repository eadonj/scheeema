class ChangeJoinTableName < ActiveRecord::Migration
  def change
    rename_table :paradigms_philosophers, :philosophers_paradigms
  end
end
