class RolesController < ApplicationController
  before_action :set_role, only: [:show, :edit, :update, :destroy]

  #cancancan
  load_and_authorize_resource

  #cancancan
  load_and_authorize_resource

  # GET /roles
  def index
    # @roles = Role.all
    @q = Role.search(params[:q]) 
    @roles = @q.result.page(params[:page])
  end

  # GET /roles/1
  def show
  end

  # GET /roles/new
  def new
    @role = Role.new
  end

  # GET /roles/1/edit
  def edit
  end

  # POST /roles
  def create
    @role = Role.new(role_params)
    # http://www.justinweiss.com/articles/respond-to-without-all-the-pain/
    flash[:notice] = "Successfully created.." if @role.save
    respond_with(@role)

    # From rails 4.2, it was originally:
    # if @role.save
      # redirect_to @role, notice: 'Role was successfully created.'
    # else
      # render :new
    # end
  end

  
  
  # PATCH/PUT /roles/1
  # def update
    # if @role.update(role_params)
      # respond_with(@role)
      # # was..
      # # redirect_to @role, notice: 'Role was successfully updated.'
    # else
      # render :edit
      # # ? not sure what to do here... respond_with(@role)
    # end
  # end

  # from rail263...
  # PATCH/PUT /roles/1
  def update
    respond_to do |format|
      if @role.update(role_params)
        format.html { redirect_to @role, notice: t('success_update') }
        format.json { render :show, status: :ok, location: @role }
      else
        format.html { render :edit }
        format.json { render json: @role.errors, status: :unprocessable_entity }
      end
    end
  end

  
  # DELETE /roles/1
  def destroy
    @role.destroy
    redirect_to roles_url, notice: 'Role was successfully destroyed.'
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_role
      @role = Role.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def role_params
      params.require(:role).permit(:name, :description, :active_status, :sort)
    end
end
