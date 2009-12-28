class SitesController < ApplicationController
  def show
    unless params[:slug]
      redirect_to "http://usejquery.com/sites/#{params[:id]}"
    else
      @site = Site.find params[:id]
    end
  end
end