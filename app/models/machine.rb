class Machine < ApplicationRecord
  extend FriendlyId

  has_many :indicateurs

  #constantes incidence
  INCIDENCE = {"grave" => 0.1, "importante" => 1, "moyenne" => 2, "possible"=> 3, "aucune" => 4}

  #constantes importance
  IMPORTANCE = {"strategique" => 0.1, "important" => 1, "primaire" => 2, "secondaire"=> 3, "secours" => 4}

  #constantes etat
  ETAT = {"a reformer" => 0.1, "a rénover" => 1, "mauvais" => 2, "bon"=> 3, "neuf" => 4}

  #constantes utilisation
  UTILISATION  = {"saturé" => 0.1, "fort" => 1, "moyen" => 2, "faible"=> 3, "minime" => 4}


  #constantes status
  STATUS_SUPERCRITIQUE = 1
  STATUS_CRITIQUE = 8


  #######
  friendly_id :libelle, use: :slugged

  #methodes
  def update_etat
    indic = self.indicateurs
    worst = 4
    indic.each do |i|
      worst = i.etat if i.etat < worst
    end
    self.etat = worst
    self.save
  end

  def calcul_poids
    return (self.incidence * self.importance * self.etat * self.utilisation).round(3)
  end

  def get_decision
    poids = self.calcul_poids
    if poids < STATUS_SUPERCRITIQUE
      "Status super critique ! Vous devez procéder à la maintenance immediatement"
    elsif poids > STATUS_SUPERCRITIQUE and poids < STATUS_CRITIQUE
      "Status critique, veuillez procéder à une maintenance dès que possible"
    else
      "Status non critique, tout est en ordre"
    end
  end

  def get_indicateurs_critiques
    critiques = []
    self.indicateurs.each do |i|
      if i.etat <= ETAT["mauvais"]
        hash = {"full_indicator" => i, "state_label" => Indicateur::ETAT.key(i.etat) }
        critiques << hash
      end
    end
    critiques
  end
end
