class AddSettingCountToUsers < ActiveRecord::Migration[5.1]
  def change
    add_column :users, :settings_count, :integer
  end
end
