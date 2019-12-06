class AddScoreCountToSettings < ActiveRecord::Migration[5.1]
  def change
    add_column :settings, :scores_count, :integer
  end
end
