class ProductsController < ApplicationController
  def index # products_index_path   GET /products/index(.:format)   products#index
    @products = Product.all
  end

  def show # product_path GET  /products/:id(.:format) products#show
    @product = Product.find(params[:id])
    @comments=@product.comments
  end

  def new
    @categories = Category.all
  end

  def edit
    @product = Product.find(params[:id])
    @categories = Category.all
  end

  def create
    category = Category.find(products_params[:category])
    product = Product.new(name: products_params[:name], description: products_params[:description], pricing: products_params[:pricing], category: category)
    if product.save
        redirect_to '/products'
    else
        flash[:errors] = product.errors.full_messages
        redirect_to '/products/new'
    end
  end

  def update
    product = Product.find(params[:id])
    product.update(name: products_params[:name], description: products_params[:description], pricing: products_params[:pricing], category_id: products_params[:category])
    redirect_to "/products"
  end

  def destroy
    product = Product.find(params[:id])
    product.destroy
    redirect_to "/products"
  end
  private
    def products_params
        params.require(:product).permit(:name, :description, :pricing, :category)
    end

end


