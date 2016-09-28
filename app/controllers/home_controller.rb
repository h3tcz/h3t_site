# frozen_string_literal: true
class HomeController < ApplicationController
  layout 'application'

  # new homepage is going to be in here
  def homepage
    @projects = Project.published.published_front_page.order(created_at: :desc)
    @static_pages = StaticPage.all
  end
end
