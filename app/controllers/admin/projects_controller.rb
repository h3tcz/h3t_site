# frozen_string_literal: true
module Admin
  class ProjectsController < AdminController
    before_action :find_projects, only: [:index]
    before_action :find_project, only: [:show, :edit, :update, :destroy]

    def index
    end

    def show
    end

    def new
      @project = Project.new
      @project.pictures.build
    end

    def create
      @project = Project.new(premitted_params[:project])

      if @project.save
        redirect_to admin_projects_path
      else
        render 'new'
      end
    end

    def edit
      @project.pictures.build if @project.pictures.empty?
    end

    def update
      if @project.update_attributes(premitted_params[:project])
        redirect_to admin_projects_path
      else
        render 'edit'
      end
    end

    def destroy
      @project.destroy
      redirect_to admin_projects_path, notice: 'Projekt smazan!'
    end

    private

    def find_projects
      @projects = Project.all.unscoped
      if params[:search].try(:[], :name)
        @projects = @projects.where('title_cz ILIKE ?', "%#{params[:search][:name]}%")
      end
      if params[:search].try(:[], :order)
        @projects = @projects.order(params[:search][:order])
      end
      @projects = @projects.paginate(page: params[:page], per_page: 15)
    end

    def find_project
      @project = Project.find(params[:id])
    end

    def premitted_params
      params.permit(project: [:published, :published_front, :year,
                              :slug_cz, :slug_en, :title_cz, :title_en,
                              :content_cz, :content_en, :location_cz,
                              :location_en, :collaborator_cz, :collaborator_en,
                              :title_picture,
                              tag_ids: [],
                              pictures_attributes: [:id, :image, :_destroy]])
    end
  end
end
