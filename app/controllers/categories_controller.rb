class CategoriesController < ApplicationController

  def new
    @category = Category.new
  end

  def create
    @category = Category.new(category_params)
    if @category.save
      redirect_to doctors_path
    end
  end

  private

  def category_params
    params.require(:category).permit(:ailment, :specialty)
  end
end
