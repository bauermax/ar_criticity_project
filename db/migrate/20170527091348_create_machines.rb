class CreateMachines < ActiveRecord::Migration[5.0]
  def change
    create_table :machines do |t|
      t.string :libelle
      t.float :incidence
      t.float :importance
      t.float :etat
      t.float :utilisation

      t.timestamps
    end
  end
end
