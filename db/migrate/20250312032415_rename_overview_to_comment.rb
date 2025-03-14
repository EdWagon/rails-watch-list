class RenameOverviewToComment < ActiveRecord::Migration[7.1]
  def change
    rename_column :bookmarks, :overview, :comment
  end
end
