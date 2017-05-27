class IndicateursController < ApplicationController
  before_action :set_machine
  def index
  end

  def new
    @indicateur = @machine.indicateurs.new
  end

  def create
    @indicateur = @machine.indicateurs.new(indicateur_params)
    if @indicateur.save
      redirect_to machine_path(@machine)
    else
      redirect_to machine_path(@machine)
    end
  end

  private
  def set_machine
    @machine = Machine.friendly.find(params[:machine_id])
  end

  def set_indicateur
    @indicateur = Indicateur.find(params[:indicateur_id])
  end

  def indicateur_params
    params.require(:indicateur).permit(:libelle,:etat, :commentaire)
  end
end
