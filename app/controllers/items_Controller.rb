# app/controllers/items_controller.rb
class ItemsController < ApplicationController
  before_action :authenticate_user!

  def index
    @items = current_user.items.includes(:expenses)
  end

  def show
    @item = Item.find(params[:id])
    # puts "@item: #{@item.inspect}"
    @expenses = Expense.where(item_id: params[:id]).order(created_at: :desc)
    # @expenses = @item.expenses
    # puts "@item: #{@expenses.inspect}"
    @total_amount = @expenses.sum(:amount)
  end

  def new
    @item = Item.new
  end

  def create
    @item = current_user.items.build(item_params)
    if @item.save
      redirect_to items_path, notice: 'Item was successfully created.'
    else
      render 'new'
    end
  end


  private

  def item_params
    params.require(:item).permit(:name, :icon)
  end

  # def expense_params
  #   params.require(:expense).permit(:name, :amount ,:item_id)
  # end
end
