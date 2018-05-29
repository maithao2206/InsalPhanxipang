class Admin::CategoriesController < Admin::ApplicationController
  before_action :load_category, only: :destroy
  def index
    @categories = Category.page(params[:page]).per(5)
    @category = Category.new
  end

  def new
    redirect_to admin_categories_path
  end

  def create
    if @category = Category.create(category_params)
      redirect_to admin_categories_path, :notice => ["Tạo thành công!", "success"]
    else
      redirect_to new_admin_category_path, :notice => ["Tạo thất bại!", "error"]
    end
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

  def category_params
    params.require(:category).permit(:name, :image)
  end
end
