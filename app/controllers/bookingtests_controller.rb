class BookingtestsController < ApplicationController
  before_action :set_bookingtest, only: [:show, :edit, :update, :destroy]

  # GET /bookingtests
  def index
    @bookingtests = Bookingtest.unscoped.page(params[:page]).per(2)
    a=1
  end

  # GET /bookingtests/1
  def show
  end

  # GET /bookingtests/new
  def new
    @bookingtest = Bookingtest.new
  end

  # GET /bookingtests/1/edit
  def edit
  end

  # POST /bookingtests
  def create
    @bookingtest = Bookingtest.new(bookingtest_params)
    @rooms = []
    room = Room.new
    room.name = "room Name";
    room.descriptions = "descriptions"
    room.minrate = 12345
    room.active  = true;
    @rooms.push(room);
    @bookingtest.Room = @rooms

    if @bookingtest.save
      redirect_to @bookingtest, notice: 'Bookingtest was successfully created.'
    else
      render :new
    end
  end

  # PATCH/PUT /bookingtests/1
  def update
    rooms = params[:bookingtest][:Room]
    booking = Bookingtest.new
    booking._id = params[:id]
    booking.customer_name = params[:bookingtest][:customer_name]
    booking.hotel_name = params[:bookingtest][:hotel_name]
    booking.night_number = params[:bookingtest][:night_number]
    booking.Room = rooms
    if @bookingtest.update(bookingtest_params)
      @bookingtest.update_attribute(:Room, rooms)
      redirect_to @bookingtest, notice: 'Bookingtest was successfully updated.'
    else
      render :edit
    end
  end

  # DELETE /bookingtests/1
  def destroy
    @bookingtest.destroy
    redirect_to bookingtests_url, notice: 'Bookingtest was successfully destroyed.'
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_bookingtest
      @bookingtest = Bookingtest.unscoped.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def bookingtest_params
      booking = params.require(:bookingtest).permit(:customer_name, :hotel_name, :night_number, :from_date, :to_date, :active)
      booking

    end
end
