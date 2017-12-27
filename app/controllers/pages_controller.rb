class PagesController < ApplicationController
  skip_before_action :authenticate_user!, only: [ :home , :bon]

  def home
  end

  def bon
    @first_name = params[:first_name]
    @last_name = params[:last_name]
    @product_name = params[:product_name]
    render :layout => false
  end
end
