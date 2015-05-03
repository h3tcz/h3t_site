class ProjectsController < ApplicationController
  before_filter :find_project, only: :show

  def index
    @years = Project.all.pluck(:year).compact.uniq.sort
    if params[:year].present?
      @projects = Project.with_year(params[:year])
    else
      @projects = Project.all
    end
  end

  def show
  end

  private

  def find_project
    @project = Project.find_by_slug_cz(params[:id])
  end
end
