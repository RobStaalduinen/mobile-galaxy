class IosListingsController < ApplicationController

  def index
    limit = params[:limit] || 10
    page = params[:page].to_i || 1
    page = [page, 1].max
    offset = ((page - 1) * limit.to_i) || 0

    # @listings = IosStoreListing.where('lower(unaccent(name)) LIKE lower(unaccent(?))', "%#{params[:query]}%")
    #                            .order(name: :asc) \
    #                            .limit(limit) \
    #                            .offset(offset)

    @listings = TestData.test_autocomplete
  end

  def show
    @listing = TestData.test_app
    @recommendations = TestData.test_recommendations
  end

  def record_event
    @base_listing = TestData.test_app
    @recommendation = TestData.test_recommendations.last

    render json: {status: :ok}
  end

end
