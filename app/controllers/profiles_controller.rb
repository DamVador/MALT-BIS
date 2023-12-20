class ProfilesController < ApplicationController
  before_action :set_profile, only: %i[ show edit update destroy ]

  PRODUCTS_SIZE = 24
  # GET /profiles or /profiles.json
  def index
    #@profiles = Profile.all
    
    @page = (params[:page] || 0).to_i
    puts "============="
    puts params[:category]
    puts params[:location]
    puts  @profiles = Profile.where('location', params[:location]).offset(PRODUCTS_SIZE * @page).limit(PRODUCTS_SIZE)
    
    puts "============="
    # bug here
    if params[:category].present? and params[:location].present?
        @profiles = Profile.where('location LIKE ?', "%#{params[:location]}%")
    #@profiles = Profile.where('location LIKE ?', "%#{params[:location]}%").where('category LIKE ?', "%#{params[:category]}%").order('created_at DESC')
    #@profiles = Profile.where(['location LIKE ? AND category LIKE ?', "%#{params[:location]}%", "%#{params[:category]}%"]).order('created_at DESC')
      @page_number = @profiles.count / PRODUCTS_SIZE
    else
      @page_number = Profile.all.count / PRODUCTS_SIZE
      @profiles = Profile.offset(PRODUCTS_SIZE * @page).limit(PRODUCTS_SIZE)
    end
    puts "PROFILES HERE"
    puts @profiles
    puts "======="

    if not current_user
      render 'home/index'
    end
  end

  def search_bar
    @page = (params[:page] || 0).to_i
    @page_number = Profile.all.count / PRODUCTS_SIZE
    @profiles = Profile.where("category", params[:category]).where("location", params[:location]).offset(PRODUCTS_SIZE * @page).limit(PRODUCTS_SIZE)
    render 'profiles/search_profile'
  end

  def filter

  end

  # GET /profiles/1 or /profiles/1.json
  def show
  end

  # GET /profiles/new
  def new
    @profile = Profile.new
  end

  # GET /profiles/1/edit
  def edit
  end

  # POST /profiles or /profiles.json
  def create
    @profile = Profile.new(profile_params)

    respond_to do |format|
      if @profile.save
        format.html { redirect_to profile_url(@profile), notice: "Profile was successfully created." }
        format.json { render :show, status: :created, location: @profile }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @profile.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /profiles/1 or /profiles/1.json
  def update
    respond_to do |format|
      if @profile.update(profile_params)
        format.html { redirect_to profile_url(@profile), notice: "Profile was successfully updated." }
        format.json { render :show, status: :ok, location: @profile }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @profile.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /profiles/1 or /profiles/1.json
  def destroy
    @profile.destroy

    respond_to do |format|
      format.html { redirect_to profiles_url, notice: "Profile was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_profile
      @profile = Profile.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def profile_params
      params.require(:profile).permit(:index, :show, :edit, :delete, :new)
    end
end
