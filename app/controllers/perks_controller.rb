class PerksController < ApplicationController
  before_action :set_perk, only: [:show, :edit, :update, :destroy]

  # GET /perks
  # GET /perks.json
  def index
    @perks = Perk.all.order('name')
  end

  # GET /perks/1
  # GET /perks/1.json
  def show
  end

  # GET /perks/new
  def new
    @perk = Perk.new
    authorize @perk
  end

  # GET /perks/1/edit
  def edit
    authorize @perk
  end

  # POST /perks
  # POST /perks.json
  def create
    @perk = Perk.new(perk_params)
    authorize @perk

    respond_to do |format|
      if @perk.save
        format.html { redirect_to perks_path, notice: 'Perk was successfully created.' }
        format.json { render :show, status: :created, location: @perk }
      else
        format.html { render :new }
        format.json { render json: @perk.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /perks/1
  # PATCH/PUT /perks/1.json
  def update
    authorize @perk
    respond_to do |format|
      if @perk.update(perk_params)
        format.html { redirect_to perks_path, notice: 'Perk was successfully updated.' }
        format.json { render :show, status: :ok, location: @perk }
      else
        format.html { render :edit }
        format.json { render json: @perk.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /perks/1
  # DELETE /perks/1.json
  def destroy
    authorize @perk
    @perk.destroy
    respond_to do |format|
      format.html { redirect_to perks_url, notice: 'Perk was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_perk
      @perk = Perk.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def perk_params
      params.require(:perk).permit(:name, :description, :offer, :url, :logo)
    end
end
