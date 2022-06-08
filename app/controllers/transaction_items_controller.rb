class TransactionItemsController < ApplicationController
  before_action :authenticate_user!

  def index
    @current_user = current_user
    @category = Category.find(params[:category_id])
    unless @current_user.categories.include? @category
      flash[:alert] = "You are not allowed to manage the #{@category.name} category. Select a category from the list."
      redirect_to categories_url
    end
    @transactions = @category.transaction_items
  end

  def new
    @current_user = current_user
    @category = Category.find(params[:category_id])
    unless @current_user.categories.include? @category
      flash[:alert] = "You are not allowed to manage the #{@category.name} category. Select a category from the list."
      redirect_to categories_url
    end
  end

  def create
    @current_user = current_user
    category = Category.find(params[:transaction_item][:category_id])
    if @current_user.categories.include? category
      transaction = @current_user.transaction_items.new(transaction_params)
      if transaction.save
        flash[:notice] = 'Transaction was successfully created.'
        redirect_to category_transaction_items_path(params[:transaction_item][:category_id])
      else
        flash[:alert] = transaction.errors.full_messages.to_sentence
        redirect_to new_category_transaction_item_path(params[:transaction_item][:category_id])
      end
    else
      flash[:alert] = "You are not allowed to manage the #{category.name} category. Select a category from the list."
      redirect_to categories_url
    end
  end

  private

  def transaction_params
    params.require(:transaction_item).permit(:name, :amount, :category_id )
  end
end
