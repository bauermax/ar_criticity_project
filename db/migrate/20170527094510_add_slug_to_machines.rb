class AddSlugToMachines < ActiveRecord::Migration[5.0]
  def change
    add_column :machines, :slug, :string
  end
end
