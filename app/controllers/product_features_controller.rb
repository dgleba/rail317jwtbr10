class ProductFeaturesController < ApplicationController
  before_action :set_product_feature, only: [:show, :edit, :update, :destroy]

  #cancancan
  load_and_authorize_resource

  #cancancan
  load_and_authorize_resource

  # GET /product_features
  def index
    # @product_features = ProductFeature.all
    @q = ProductFeature.search(params[:q]) 
    @product_features = @q.result.page(params[:page])
  end

  # GET /product_features/1
  def show
  end

  # GET /product_features/new
  def new
    @product_feature = ProductFeature.new
  end

  # GET /product_features/1/edit
  def edit
  end

  # POST /product_features
  def create
    @product_feature = ProductFeature.new(product_feature_params)
    # http://www.justinweiss.com/articles/respond-to-without-all-the-pain/
    flash[:notice] = "Successfully created.." if @product_feature.save
    respond_with(@product_feature)

    # From rails 4.2, it was originally:
    # if @product_feature.save
      # redirect_to @product_feature, notice: 'Product feature was successfully created.'
    # else
      # render :new
    # end
  end

  
  
  # PATCH/PUT /product_features/1
  # def update
    # if @product_feature.update(product_feature_params)
      # respond_with(@product_feature)
      # # was..
      # # redirect_to @product_feature, notice: 'Product feature was successfully updated.'
    # else
      # render :edit
      # # ? not sure what to do here... respond_with(@product_feature)
    # end
  # end

  # from rail263...
  # PATCH/PUT /product_features/1
  def update
    respond_to do |format|
      if @product_feature.update(product_feature_params)
        format.html { redirect_to @product_feature, notice: t('success_update') }
        format.json { render :show, status: :ok, location: @product_feature }
      else
        format.html { render :edit }
        format.json { render json: @product_feature.errors, status: :unprocessable_entity }
      end
    end
  end

  
  # DELETE /product_features/1
  def destroy
    @product_feature.destroy
    redirect_to product_features_url, notice: 'Product feature was successfully destroyed.'
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_product_feature
      @product_feature = ProductFeature.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def product_feature_params
      params.require(:product_feature).permit(:name, :product_id, :pfeature_id, :active_status, :sort)
    end
end
