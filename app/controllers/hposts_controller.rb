class HpostsController < ApplicationController
    before_action :set_hpost, only: %i[ show update destroy ]

    # GET /hposts
    def index
      @hposts = Hpost.all
      
      render json: @hposts
    end
  
    # GET /hposts/1
    def show
      render json: @hpost
    end
  
    # POST /hposts
    def create
      @hpost = Hpost.new(hpost_params)
  
      if @hpost.save
        render json: @hpost, status: :created, location: @hpost
      else
        render json: @hpost.errors, status: :unprocessable_entity
      end
    end
  
    # PATCH/PUT /hposts/1
    def update
      if @hpost.update(hpost_params)
        render json: @hpost
      else
        render json: @hpost.errors, status: :unprocessable_entity
      end
    end
  
    # DELETE /hposts/1
    def destroy
      @hpost.destroy
    end
  
    private
      # Use callbacks to share common setup or constraints between actions.
      def set_hpost
        @hpost = Hpost.find(params[:id])
      end
  
      # Only allow a list of trusted parameters through.
      def hpost_params
        params.require(:hpost).permit(:title, :h_request, :user_id)
      end
  end
  
