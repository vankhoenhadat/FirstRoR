require 'test_helper'

class BookingtestsControllerTest < ActionController::TestCase
  setup do
    @bookingtest = bookingtests(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:bookingtests)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create bookingtest" do
    assert_difference('Bookingtest.count') do
      post :create, bookingtest: { active: @bookingtest.active, customer_name: @bookingtest.customer_name, from_date: @bookingtest.from_date, hotel_name: @bookingtest.hotel_name, night_number: @bookingtest.night_number, to_date: @bookingtest.to_date }
    end

    assert_redirected_to bookingtest_path(assigns(:bookingtest))
  end

  test "should show bookingtest" do
    get :show, id: @bookingtest
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @bookingtest
    assert_response :success
  end

  test "should update bookingtest" do
    patch :update, id: @bookingtest, bookingtest: { active: @bookingtest.active, customer_name: @bookingtest.customer_name, from_date: @bookingtest.from_date, hotel_name: @bookingtest.hotel_name, night_number: @bookingtest.night_number, to_date: @bookingtest.to_date }
    assert_redirected_to bookingtest_path(assigns(:bookingtest))
  end

  test "should destroy bookingtest" do
    assert_difference('Bookingtest.count', -1) do
      delete :destroy, id: @bookingtest
    end

    assert_redirected_to bookingtests_path
  end
end
