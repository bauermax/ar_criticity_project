class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  before_action :update_state


  def update_state
    Machine.all.each do |m|
      m.update_etat
    end
  end
end
