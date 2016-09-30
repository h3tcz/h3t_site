# frozen_string_literal: true
class StaticPagesController < ApplicationController
  before_action :find_static_page, only: :show

  def show
  end

  private

  def find_static_page
    @static_page = StaticPage.find_by_slug_cz(params[:id])
  end
end
