class ExpensesController < ApplicationController
  before_action :set_item

  def index
    @expenses = @item.expenses.order(created_at: :desc)
    @total_amount = @expenses.sum(:amount)
  end

  def new
    @expense = Expense.new
  end

  def create
    @expense = @item.expenses.build(expense_params)
    @expense.user = current_user
    if @expense.save
      redirect_to item_expenses_path(@item) , notice: 'expense was successfully created.'
    else
      puts "Errors: #{@expense.errors.full_messages}"
      render 'new'
    end
  end
  private

  def set_item
    @item = Item.find(params[:item_id])
  end

  def expense_params
    params.require(:expense).permit(:name, :amount, :item_id)
  end
end
