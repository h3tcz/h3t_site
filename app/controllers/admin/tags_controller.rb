# frozen_string_literal: true
module Admin
  class TagsController < AdminController
    before_action :find_tags, only: [:index]
    before_action :find_tag, only: [:edit, :update, :destroy]

    def index
    end

    def new
      @tag = Tag.new
    end

    def create
      @tag = Tag.new(premitted_params[:tag])

      if @tag.save
        redirect_to admin_tags_path
      else
        render 'new'
      end
    end

    def edit
    end

    def update
      if @tag.update_attributes(premitted_params[:tag])
        redirect_to admin_tags_path
      else
        render 'edit'
      end
    end

    def destroy
      @tag.destroy
      redirect_to admin_tags_path
    end

    private

    def find_tags
      @tags = Tag.all.paginate(page: params[:page])
    end

    def find_tag
      @tag = Tag.find(params[:id])
    end

    def premitted_params
      params.permit(tag: [:name])
    end
  end
end
