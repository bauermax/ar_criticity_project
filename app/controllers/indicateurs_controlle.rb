class IndicateursController < ApplicationController

  before_action :set_machine
  #CRUD METHODS
  def index
  end

  def show
  end

  def new
    @machine = Machine.new
  end

  def create
    @machine = Machine.new(machine_params)
    if @machine.save
      redirect_to root_path
    else
      redirect_to root_path
    end
  end

  def edit
  end

  def update
    if @machine.update(machine_params)
      redirect_to machine_path(@machine)
    else
      render :edit
    end
  end

  def destroy
    if @machine.destroy
      redirect_to machines_path
    else
      redirect_to machines_path
    end
  end

  #PRIVATE METHODS
  private

  def set_indicateurs
    @machines = Machine.all
  end

  def set_machine
    @machine = Machine.friendly.find(params[:id])
  end

  def indicateurs_params
    params.require(:machine).permit(:libelle,:etat,:commentaire)
  end

end
