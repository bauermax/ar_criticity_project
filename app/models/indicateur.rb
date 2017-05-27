class Indicateur < ApplicationRecord
  belongs_to :machine

  #constantes
  ETAT = {"a reformer" => 0.1, "a rénover" => 1, "mauvais" => 2, "bon"=> 3, "neuf" => 4}



end
