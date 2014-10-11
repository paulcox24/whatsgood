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
    @categories = Category.all.order(:name)
  end

  def destroy
    @category = Category.find(params[:id])
    @category.destroy
    redirect_to categories_path
  end
end

