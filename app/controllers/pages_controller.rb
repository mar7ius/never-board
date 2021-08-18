class PagesController < ApplicationController
  skip_before_action :authenticate_user!, only: :home
  def home
    @games = Game.order('updated_at DESC').limit(4)
  end
end
