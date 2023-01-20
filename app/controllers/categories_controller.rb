class CategoriesController < ApplicationController
  before_action :authenticate_user!

  def index
    @current_user = current_user
    @categories = @current_user.categories.order(name: :asc)
  end

  def new
    @current_user = current_user
  end

  def create
    @current_user = current_user
    category = @current_user.categories.new(category_params)
    if category.save
      flash[:notice] = 'Category was successfully created.'
      redirect_to categories_url
    else
      flash[:alert] = category.errors.full_messages.to_sentence
      render :new, status: 422
    end
  end

  private

  def category_params
    params.require(:category).permit(:name, :icon)
  end
end
