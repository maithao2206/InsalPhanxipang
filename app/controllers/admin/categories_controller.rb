class Admin::CategoriesController < Admin::ApplicationController
  before_action :load_category, only: :destroy
  def index
    @categories = Category.page(params[:page]).per(5)
  end

  def destroy
    @category.update(is_deleted: true)
    if @category.is_deleted
      redirect_to admin_categories_path, :notice => ["Xóa thành công", "success"]
    else
      redirect_to admin_categories_path, :notice => ["Xóa không thành công", "error"]
    end
  end

  private

  def load_category
    @category = Category.find_by id: params[:id]
  end
end
