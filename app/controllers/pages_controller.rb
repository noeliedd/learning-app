class PagesController < ApplicationController
  def home
  end
  before_filter :authenticate_user!
  def about
  end
end
