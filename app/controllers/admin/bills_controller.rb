class Admin::BillsController < Admin::ApplicationController
  def index
    @q = Bill.ransack(params[:q])
    @bills = @q.result.includes(:user).page(params[:page]).per(10)
  end

  def show
    @bill = Bill.find_by_id(params[:id])
    @productbill = ProductBill.find_by_bill_id(@bill.id)
    @productid = @productbill.distinct.pluck(:product_id)
    @productnumber = @productbill.group(:product_id).count
    @productname = []
    @productprice = []
    @productid.each do |e|
      @product = Product.find_by_id(e)
      @productname.push(@product.name)
      @productprice.push(@product.price)
    end
    respond_to do |format|
      format.js { }
    end
  end

  def new

  end

  def create
    respond_to do |format|
      format.js{}
    end
  end

end
