class IndicateursController < ApplicationController
  before_action :set_machine
  before_action :set_indicateur, :only => [:edit,:update]
  def index
  end

  def new
    @indicateur = @machine.indicateurs.new
  end

  def edit
    puts params.inspect

  end

  def create
    @indicateur = @machine.indicateurs.new(indicateur_params)
    if @indicateur.save
      redirect_to machine_path(@machine)
    else
      redirect_to machine_path(@machine)
    end
  end

  def update
    if @indicateur.update(indicateur_params)
      redirect_to machine_path(@machine)
    else
      render :edit
    end
  end

  private
  def set_machine
    @machine = Machine.friendly.find(params[:machine_id])
  end

  def set_indicateur
    @indicateur = Indicateur.find(params[:id])
  end

  def indicateur_params
    params.require(:indicateur).permit(:libelle,:etat, :commentaire)
  end
end
