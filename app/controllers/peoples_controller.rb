class PeoplesController < ApplicationController
  before_action :set_user, only: [:show, :edit, :update, :destroy]

  # GET /users
  # GET /users.json
  def index
    @peoples = User.all
  end

  # GET /users/1
  # GET /users/1.json
  def show
  end

  # GET /users/new
  def new
    @people = User.new
    authorize @people
  end

  # GET /users/1/edit
  def edit
    authorize @people
  end

  # POST /users
  # POST /users.json
  def create
    @people = User.new(user_params)
    authorize @people

    respond_to do |format|
      if @people.save
        format.html { redirect_to peoples_path, notice: 'user was successfully created.' }
        format.json { render :show, status: :created, location: @people }
      else
        format.html { render :new }
        format.json { render json: @people.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /users/1
  # PATCH/PUT /users/1.json
  def update
    authorize @people
    respond_to do |format|
      if @people.update(user_params)
        format.html { redirect_to peoples_path, notice: 'User was successfully updated.' }
        format.json { render :show, status: :ok, location: @people }
      else
        format.html { render :edit }
        format.json { render json: @people.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /users/1
  # DELETE /users/1.json
  def destroy
    @people.destroy
    respond_to do |format|
      format.html { redirect_to users_url, notice: 'User was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_user
      @people = User.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def user_params
      params.require(:user).permit(:email, :first_name, :last_name, :nickname, :title, :startup_id, :facebook, :instagram, :twitter, :linkedin, :github, :dribbble, :phone)
    end
end
