class Api::MachinesController < ApplicationController

  def index
    @machines = Machine.all
    render json: @machines
  end

  def show
    @machine = Machine.friendly.find(params[:id])

    table =  {
      "machine" => @machine
      #"machine_criticity_weight" => @machine.calcul_poids,
      #"machine_critical_indicators" => @machine.get_indicateurs_critiques,
      #"machine_suggestion" => @machine.get_decision
    }



    render json: table
  end
end
