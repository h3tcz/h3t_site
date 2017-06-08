# frozen_string_literal: true

class ProjectsController < ApplicationController
  before_action :find_project, only: :show

  def index
    @years = Project.published.pluck(:year).compact.uniq.sort
    @projects = if params[:year].present?
                  Project.published.with_year(params[:year])
                else
                  Project.published
                end
    @projects.order!(created_at: :desc)
  end

  def show; end

  private

  def find_project
    @project = Project.find_by(slug_cz: params[:id])
  end
end
