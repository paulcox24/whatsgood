class CategoriesController < ApplicationController
  def update_eventful_categories
    @categories = Category.all
    @category_names = @categories.map { |category| category.name }

    eventful = Eventful::API.new ENV["EVENTFUL_API_KEY"]
    category_list = eventful.call 'categories/list'
    @eventful_categories = (category_list['category']).map { |category| category['id'] }
    @eventful_categories.delete_if {|category| @category_names.include? category }

    @eventful_categories.each do |category| 
      Category.create(name: category)
    end  
    redirect_to categories_path
  end

  def index
    if current_user.is_admin
      @categories = Category.all.order(:name)
    else 
      redirect_to root_path, notice: "Not allowed" 
    end  
  end

  def destroy
    if current_user.is_admin
      @category = Category.find(params[:id])
      @category.destroy

      respond_to do |format|
        format.html { redirect_to categories_path }
        format.js
      end
    else
      redirect_to root_path, notice: "Not allowed" 
    end
  end
end

