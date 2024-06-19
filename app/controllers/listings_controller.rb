class ListingsController < ApplicationController
  before_action :set_listing, only: %i[show update destroy]
  def index
    @listings = Listing.select(:id, :num_rooms)

    render json: { listings: @listings }
  end

  def show
    render json: {
      listing: @listing
    }
  end

  def create
    @listing = Listing.new(listing_params)

    if @listing.save
      render json: {
        listing: @listing
      }
    else
      render json: {
        errors: @listing.errors.details
      }, status: :unprocessable_entity
    end
  end

  def update
    if @listing.update(listing_params)
      render json: {
        listing: @listing
      }
    else
      render json: {
        errors: @listing.errors.details
      }, status: :unprocessable_entity
    end
  end

  def destroy
    if @listing.destroy
      render head: :no_content
    else
      render json: {
        errors: @listing.errors.details
      }
    end
  end

  private

  def listing_params
    params.require(:listing).permit(:num_rooms)
  end

  def set_listing
    @listing = Listing.find(params[:id])
  end
end
