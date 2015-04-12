class Admin::StaticPagesController < AdminController
  before_filter :find_static_pages, only: [:index]
  before_filter :find_static_page, only: [:show, :edit, :update, :destroy]

  def index
  end

  def show
  end

  def new
    @static_page = StaticPage.new
  end

  def create
    @static_page = StaticPage.new(premitted_params[:static_page])

    if @static_page.save
      redirect_to admin_static_pages_path
    else
      render 'new'
    end
  end

  def edit
  end

  def update
    if @static_page.update_attributes(premitted_params[:static_page])
      redirect_to admin_static_pages_path
    else
      render 'edit'
    end
  end

  def destroy
    @static_page.destroy
    redirect_to admin_static_pages_path
  end

  private

  def find_static_pages
    @static_pages = StaticPage.all.paginate(page: params[:page])
  end

  def find_static_page
    @static_page = StaticPage.find(params[:id])
  end

  def premitted_params
    params.permit(static_page: [:published, :slug_cz, :slug_en, :title_cz, :title_en, :content_cz, :content_en])
  end
end
