class ProductsController < ApplicationController
  # before_action :log_relevant_headers
  before_action :set_product, only: %i[ show edit update destroy ]
  allow_unauthenticated_access only: %i[ index show ]

  def index
    @products = Product.all
  end

  def show
  end

  def new
    @product = Product.new
  end

  def create
    @product = Product.new(product_params)
    if @product.save
      redirect_to @product
    else
      render :new, status: :unprocessable_entity
    end
  end

  def edit
  end

  def update
    if @product.update(product_params)
      redirect_to @product
    else
      render :edit, status: :unprocessable_entity
    end
  end

  def destroy
    @product.destroy
    redirect_to products_path
  end

  private
    def set_product
      @product = Product.find(params[:id])
    end

    def product_params
      params.expect(product: [ :name, :description, :featured_image, :specification, :inventory_count ])
    end

    def log_relevant_headers
      headers_to_check = [
        "HTTP_ACCEPT",
        "HTTP_TURBO_FRAME",
        "HTTP_X_REQUESTED_WITH",
        "HTTP_TURBO_STREAM",
        "HTTP_TURBO_PERMANENT",
        "REQUEST_METHOD",
        "HTTP_USER_AGENT",
        "HTTP_REFERER"
      ]

      Rails.logger.info "🔍 RELEVANT HEADERS:"
      headers_to_check.each do |header|
        value = request.headers[header] || request.env[header]
        Rails.logger.info "  #{header}: #{value}" if value
      end

      # Also check if Rails detects it as XHR
      Rails.logger.info "  XHR?: #{request.xhr?}"
      Rails.logger.info "  Format: #{request.format}"
    end
end
