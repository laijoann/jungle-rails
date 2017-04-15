class Admin::CategoriesController < ApplicationController
  http_basic_authenticate_with name: ENV['ADMIN_KEY'], password: ENV['ADMIN_PASSWORD']

  def index
    @category = Category.all
  end

  def new
    @category = Category.new
  end

  def create
    @category = Category.new(category_params)

    if @category.save
      redirect_to [:admin, :categories]
    else
      render :new
    end
  end

  def destroy
    @category = Category.find params[:id]
    @category.destroy
    redirect_to [:admin, :categories]
  end

  private

  def category_params
    params.require(:category).permit(
      :name
    )
  end

end
