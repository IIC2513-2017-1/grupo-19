class PriceCategoriesController < ApplicationController
  before_action :set_price_category, only: [:show, :edit, :update, :destroy]

  # GET /price_categories
  # GET /price_categories.json
  def index
    @price_categories = PriceCategory.all
  end

  # GET /price_categories/1
  # GET /price_categories/1.json
  def show
  end

  # GET /price_categories/new
  def new
    @price_category = PriceCategory.new
  end

  # GET /price_categories/1/edit
  def edit
  end

  # POST /price_categories
  # POST /price_categories.json
  def create
    @price_category = PriceCategory.new(price_category_params)

    respond_to do |format|
      if @price_category.save
        format.html { redirect_to @price_category, notice: 'Price category was successfully created.' }
        format.json { render :show, status: :created, location: @price_category }
      else
        format.html { render :new }
        format.json { render json: @price_category.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /price_categories/1
  # PATCH/PUT /price_categories/1.json
  def update
    respond_to do |format|
      if @price_category.update(price_category_params)
        format.html { redirect_to @price_category, notice: 'Price category was successfully updated.' }
        format.json { render :show, status: :ok, location: @price_category }
      else
        format.html { render :edit }
        format.json { render json: @price_category.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /price_categories/1
  # DELETE /price_categories/1.json
  def destroy
    @price_category.destroy
    respond_to do |format|
      format.html { redirect_to price_categories_url, notice: 'Price category was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_price_category
      @price_category = PriceCategory.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def price_category_params
      params.require(:price_category).permit(:name, :description)
    end
end
