require 'test_helper'

class Admin::RestaurantsControllerTest < ActionController::TestCase
  setup do
    @admin_restaurant = admin_restaurants(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:admin_restaurants)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create admin_restaurant" do
    assert_difference('Admin::Restaurant.count') do
      post :create, admin_restaurant: @admin_restaurant.attributes
    end

    assert_redirected_to admin_restaurant_path(assigns(:admin_restaurant))
  end

  test "should show admin_restaurant" do
    get :show, id: @admin_restaurant
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @admin_restaurant
    assert_response :success
  end

  test "should update admin_restaurant" do
    put :update, id: @admin_restaurant, admin_restaurant: @admin_restaurant.attributes
    assert_redirected_to admin_restaurant_path(assigns(:admin_restaurant))
  end

  test "should destroy admin_restaurant" do
    assert_difference('Admin::Restaurant.count', -1) do
      delete :destroy, id: @admin_restaurant
    end

    assert_redirected_to admin_restaurants_path
  end
end
