class StaticPageController < ApplicationController
  skip_before_filter :authenticate_user!, only: [:about_us]
  def home
  end

  def about_us
  end
end
