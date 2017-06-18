class Indicateur < ApplicationRecord
  belongs_to :machine

  #constantes
  ETAT = {"to reform" => 0.1, "to renovate" => 1, "bad" => 2, "good"=> 3, "new" => 4}



end
