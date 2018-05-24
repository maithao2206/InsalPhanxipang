class Admin::BillsController < Admin::ApplicationController
  def index
    @q = Bill.ransack(params[:q])
    @bills = @q.result.includes(:user).page(params[:page]).per(10)
  end
end
