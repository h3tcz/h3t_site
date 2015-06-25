class Admin::ProjectsController < AdminController
  before_filter :find_projects, only: [:index]
  before_filter :find_project, only: [:show, :edit, :update, :destroy]

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
    @projects = Project.all.paginate(page: params[:page], per_page: 15)
  end

  def find_project
    @project = Project.find(params[:id])
  end

  def premitted_params
    params.permit(project: [:published, :published_front, :year, :slug_cz,
      :slug_en, :title_cz, :title_en, :content_cz, :content_en, :location_cz,
      :location_en, :collaborator_cz, :collaborator_en, :title_picture,
      tag_ids: [], :pictures_attributes => [:id, :image, :_destroy]])
  end
end
