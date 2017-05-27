class Api::MachinesController < ApplicationController

  def index
    @machines = Machine.all
    render json: @machines
  end

  def show
    @machine = Machine.friendly.find(params[:id])

    table = []
    table << @machine
    table << @machine.calcul_poids
    table << @machine.get_indicateurs_critiques

    render json: table
  end
end
