class RestoStorefrontsController < ApplicationController
  include CurrentCart
  before_action :set_cart
  # before_action :set_resto_storefront, only: [:show, :edit, :update, :destroy]

  # GET /resto_storefronts
  # GET /resto_storefronts.json
  def index
    # call sorting method
    sortRestaurantsByReview
  end

  def sortRestaurantsByReview
    # sort the restaurants by review in ascending order
    # display the name, rating, cuisineType, and website

    @reservations = Reservation.joins('INNER JOIN tables ON reservations.table_id = tables.id')
    .joins('INNER JOIN restaurants ON restaurants.id = tables.restaurant_id')
    .select('restaurants.id as rID, restaurants.name as rName, restaurants.review as rReview, restaurants.cuisineType as cuisineType, restaurants.website as site, restaurants.phoneNum as phone, restaurants.updated_at as restUpdate, tables.id, reservations.updated_at')
    .order('rReview')

  end

  # GET /resto_storefronts/1
  # GET /resto_storefronts/1.json
  def show
  end

  # GET /resto_storefronts/new
  def new
    @resto_storefront = RestoStorefront.new
  end

  # GET /resto_storefronts/1/edit
  def edit
  end

  # POST /resto_storefronts
  # POST /resto_storefronts.json
  def create
    @resto_storefront = RestoStorefront.new(resto_storefront_params)

    respond_to do |format|
      if @resto_storefront.save
        format.html { redirect_to @resto_storefront, notice: 'Resto storefront was successfully created.' }
        format.json { render :show, status: :created, location: @resto_storefront }
      else
        format.html { render :new }
        format.json { render json: @resto_storefront.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /resto_storefronts/1
  # PATCH/PUT /resto_storefronts/1.json
  def update
    respond_to do |format|
      if @resto_storefront.update(resto_storefront_params)
        format.html { redirect_to @resto_storefront, notice: 'Resto storefront was successfully updated.' }
        format.json { render :show, status: :ok, location: @resto_storefront }
      else
        format.html { render :edit }
        format.json { render json: @resto_storefront.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /resto_storefronts/1
  # DELETE /resto_storefronts/1.json
  def destroy
    @resto_storefront.destroy
    respond_to do |format|
      format.html { redirect_to resto_storefronts_url, notice: 'Resto storefront was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
  # Use callbacks to share common setup or constraints between actions.
  def set_resto_storefront
    @resto_storefront = RestoStorefront.find(params[:id])
  end

  # Never trust parameters from the scary internet, only allow the white list through.
  def resto_storefront_params
    params.require(:resto_storefront).permit(:index)
  end
end
