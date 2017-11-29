class ExploreController < ApplicationController
  before_action :authenticate_user!

  def index
    @all_areas = AreaDeInteresse.where(name: interest_areas)

    if params and params[:areas_interesse].present?
      @selected_areas = AreaDeInteresse.where(id: params[:areas_interesse].map { |item| item.to_i})
    else
      @selected_areas = AreaDeInteresse.where(name: interest_areas)
    end

    @avaliable_projects = current_user.available_projects
  end

  private

  def interest_areas
    %w(Tecnologia Engenharias Marketing Administração)
  end
end
