class HomeController < ApplicationController
  def index
    @league = Series.order(:date).last.league
  end
end
