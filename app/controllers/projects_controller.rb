class ProjectsController < ApplicationController
  before_filter :find_project, only: :show

  def index
    @years = Project.published.pluck(:year).compact.uniq.sort
    if params[:year].present?
      @projects = Project.published.with_year(params[:year])
    else
      @projects = Project.published
    end
  end

  def show
  end

  private

  def find_project
    @project = Project.find_by_slug_cz(params[:id])
  end
end
