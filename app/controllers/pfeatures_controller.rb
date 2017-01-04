class PfeaturesController < ApplicationController
  before_action :set_pfeature, only: [:show, :edit, :update, :destroy]

  #cancancan
  load_and_authorize_resource

  #cancancan
  load_and_authorize_resource

  # GET /pfeatures
  def index
    # @pfeatures = Pfeature.all
    @q = Pfeature.search(params[:q]) 
    @pfeatures = @q.result.page(params[:page])
  end

  # GET /pfeatures/1
  def show
  end

  # GET /pfeatures/new
  def new
    @pfeature = Pfeature.new
  end

  # GET /pfeatures/1/edit
  def edit
  end

  # POST /pfeatures
  def create
    @pfeature = Pfeature.new(pfeature_params)
    # http://www.justinweiss.com/articles/respond-to-without-all-the-pain/
    flash[:notice] = "Successfully created.." if @pfeature.save
    respond_with(@pfeature)

    # From rails 4.2, it was originally:
    # if @pfeature.save
      # redirect_to @pfeature, notice: 'Pfeature was successfully created.'
    # else
      # render :new
    # end
  end

  
  
  # PATCH/PUT /pfeatures/1
  # def update
    # if @pfeature.update(pfeature_params)
      # respond_with(@pfeature)
      # # was..
      # # redirect_to @pfeature, notice: 'Pfeature was successfully updated.'
    # else
      # render :edit
      # # ? not sure what to do here... respond_with(@pfeature)
    # end
  # end

  # from rail263...
  # PATCH/PUT /pfeatures/1
  def update
    respond_to do |format|
      if @pfeature.update(pfeature_params)
        format.html { redirect_to @pfeature, notice: t('success_update') }
        format.json { render :show, status: :ok, location: @pfeature }
      else
        format.html { render :edit }
        format.json { render json: @pfeature.errors, status: :unprocessable_entity }
      end
    end
  end

  
  # DELETE /pfeatures/1
  def destroy
    @pfeature.destroy
    redirect_to pfeatures_url, notice: 'Pfeature was successfully destroyed.'
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_pfeature
      @pfeature = Pfeature.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def pfeature_params
      params.require(:pfeature).permit(:name, :fdate, :active_status, :sort)
    end
end
