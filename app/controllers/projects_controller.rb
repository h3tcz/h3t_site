class ProjectsController < ApplicationController
  before_filter :find_projects, only: :index
  before_filter :find_project, only: :show

  def index
  end

  def show
  end

  private

  def find_projects
    @projects = Project.all.paginate(page: params[:page])
  end

  def find_project
    @project = Project.find_by_slug_cz(params[:id])
  end
end
