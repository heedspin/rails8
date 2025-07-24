class ProductCommentsController < ApplicationController
  before_action :set_product
  before_action :set_product_comment, only: %i[ show edit update destroy  ]
  allow_unauthenticated_access only: %i[ index show ]

  # GET /products/:product_id/product_comments
  def index
    # List all comments for a product
    @product_comments = @product.product_comments.order(:created_at)
  end

  # GET /products/:product_id/product_comments/:id
  def show
  end

  # GET /products/:product_id/product_comments/new
  def new
    @product_comment = @product.product_comments.new
  end

  # POST /products/:product_id/product_comments
  def create
    @product_comment = @product.product_comments.new(product_comment_params)
    if @product_comment.save
      redirect_to product_path(@product), notice: "Comment was successfully created."
    else
      render :new, status: :unprocessable_entity
    end
  end

  # GET /products/:product_id/product_comments/:id/edit
  def edit
  end

  # PATCH/PUT /products/:product_id/product_comments/:id
  def update
    if @product_comment.update(product_comment_params)
      redirect_to product_path(@product), notice: "Comment was successfully updated."
    else
      render :edit, status: :unprocessable_entity
    end
  end

  # DELETE /products/:product_id/product_comments/:id
  def destroy
    @product_comment.destroy
    redirect_to product_path(@product), notice: "Comment was successfully deleted."
  end

  private

    def set_product
      @product = Product.find(params[:product_id])
    end

    def set_product_comment
      @product_comment = @product.product_comments.find(params[:id])
    end

    def product_comment_params
      params.require(:product_comment).permit(:author_name, :content)
    end
end
