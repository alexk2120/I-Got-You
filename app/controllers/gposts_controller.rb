class GpostsController < ApplicationController
  before_action :set_gpost, only: %i[ show update destroy ]

  # GET /gposts
  def index
    @gposts = Gpost.all

    render json: @gposts
  end

  # GET /gposts/1
  def show
    render json: @gpost
  end

  # POST /gposts
  def create
    @gpost = Gpost.new(gpost_params)

    if @gpost.save
      render json: @gpost, status: :created, location: @gpost
    else
      render json: @gpost.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /gposts/1
  def update
    if @gpost.update(gpost_params)
      render json: @gpost
    else
      render json: @gpost.errors, status: :unprocessable_entity
    end
  end

  # DELETE /gposts/1
  def destroy
    @gpost.destroy
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_gpost
      @gpost = Gpost.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def gpost_params
      params.permit(:comment, :likes, :user_id)
    end
end
