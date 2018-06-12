class Admin::BillsController < Admin::ApplicationController
  def index
    @q = Bill.ransack(params[:q])
    @bills = @q.result.includes(:user).page(params[:page]).per(10)
  end

  def show
    @bill = Bill.find_by_bill(params[:id]).page(params[:page]).per(12)
  end

  def new

  end

  def create
    respond_to do |format|
      format.js{}
    end
  end

end
