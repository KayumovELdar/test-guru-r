class BadgesController < ApplicationController
  def index
    @badges = current_user.badges.all
  end
end
