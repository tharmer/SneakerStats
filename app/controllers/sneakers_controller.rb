class SneakersController < ApplicationController
  before_action :set_sneaker, only: [:show, :edit, :update, :destroy]
  before_action :authenticate_user!, except: [:index, :show]
  before_action :check_user, except: [:index, :show]

  # GET /sneakers
  # GET /sneakers.json
  def index
    @sneakers = Sneaker.all
  end

  # GET /sneakers/1
  # GET /sneakers/1.json
  def show
    @reviews = Review.where(sneaker_id: @sneaker.id).order("created_at DESC")
    if @reviews.blank?
      @avg_rating = 0
    else
      @avg_rating = @reviews.average(:rating).round(2)
    end
  end

  # GET /sneakers/new
  def new
    @sneaker = Sneaker.new
  end

  # GET /sneakers/1/edit
  def edit
  end

  # POST /sneakers
  # POST /sneakers.json
  def create
    @sneaker = Sneaker.new(sneaker_params)

    respond_to do |format|
      if @sneaker.save
        format.html { redirect_to @sneaker, notice: 'Sneaker was successfully created.' }
        format.json { render :show, status: :created, location: @sneaker }
      else
        format.html { render :new }
        format.json { render json: @sneaker.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /sneakers/1
  # PATCH/PUT /sneakers/1.json
  def update
    respond_to do |format|
      if @sneaker.update(sneaker_params)
        format.html { redirect_to @sneaker, notice: 'Sneaker was successfully updated.' }
        format.json { render :show, status: :ok, location: @sneaker }
      else
        format.html { render :edit }
        format.json { render json: @sneaker.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /sneakers/1
  # DELETE /sneakers/1.json
  def destroy
    @sneaker.destroy
    respond_to do |format|
      format.html { redirect_to sneakers_url, notice: 'Sneaker was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_sneaker
      @sneaker = Sneaker.find(params[:id])
    end

    def check_user
      unless current_user.admin?
          redirect_to root_url, alert: "Sorry, only admins can do that!"
      end
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def sneaker_params
      params.require(:sneaker).permit(:brand, :name, :style, :buy, :image)
    end
end
