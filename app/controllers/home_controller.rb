class HomeController < ApplicationController
  layout 'application'

  # new homepage is going to be in here
  def homepage
    @projects = Project.published.published_front_page
    @static_pages = StaticPage.all
  end
end
