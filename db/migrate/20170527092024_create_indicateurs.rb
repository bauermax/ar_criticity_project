class CreateIndicateurs < ActiveRecord::Migration[5.0]
  def change
    create_table :indicateurs do |t|
      t.references :machine, foreign_key: true
      t.string :libelle
      t.float :etat

      t.timestamps
    end
  end
end
