class AddCommentaireToIndicateurs < ActiveRecord::Migration[5.0]
  def change
    add_column :indicateurs, :commentaire, :string
  end
end
