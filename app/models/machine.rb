class Machine < ApplicationRecord
  extend FriendlyId

  has_many :indicateurs, :dependent => :delete_all

  #constantes incidence
  INCIDENCE = {"serious" => 0.1, "important" => 1, "medium" => 2, "possible"=> 3, "none" => 4}

  #constantes importance
  IMPORTANCE = {"strategic" => 0.1, "important" => 1, "primary" => 2, "secondary"=> 3, "emergency" => 4}

  #constantes etat
  ETAT = {"to reform" => 0.1, "to renovate" => 1, "bad" => 2, "good"=> 3, "new" => 4}

  #constantes utilisation
  UTILISATION  = {"saturated" => 0.1, "high" => 1, "medium" => 2, "low"=> 3, "minimal" => 4}


  #constantes status
  STATUS_SUPERCRITIQUE = 0.8
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
      "Super critical status ! You must proceed to a maintenance immediatly !"
    elsif poids > STATUS_SUPERCRITIQUE and poids < STATUS_CRITIQUE
      "critical status, you should proceed to a maintenance as soon as possible !"
    else
      "Non critical status."
    end
  end

  def get_indicateurs_critiques
    critiques = []
    self.indicateurs.each do |i|
      if i.etat <= ETAT["bad"]
        hash = {"full_indicator" => i, "state_label" => Indicateur::ETAT.key(i.etat) }
        critiques << hash
      end
    end
    critiques
  end
end
