class StaticPagesController < ApplicationController
  before_filter :find_static_page, only: :show

  def show
  end

  private

  def find_static_page
    @static_page = StaticPage.find(params[:id])
  end
end
