require 'test_helper'

class Admin::MealsControllerTest < ActionController::TestCase
  setup do
    @admin_meal = admin_meals(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:admin_meals)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create admin_meal" do
    assert_difference('Admin::Meal.count') do
      post :create, admin_meal: { is_active: @admin_meal.is_active, name: @admin_meal.name, price: @admin_meal.price }
    end

    assert_redirected_to admin_meal_path(assigns(:admin_meal))
  end

  test "should show admin_meal" do
    get :show, id: @admin_meal
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @admin_meal
    assert_response :success
  end

  test "should update admin_meal" do
    put :update, id: @admin_meal, admin_meal: { is_active: @admin_meal.is_active, name: @admin_meal.name, price: @admin_meal.price }
    assert_redirected_to admin_meal_path(assigns(:admin_meal))
  end

  test "should destroy admin_meal" do
    assert_difference('Admin::Meal.count', -1) do
      delete :destroy, id: @admin_meal
    end

    assert_redirected_to admin_meals_path
  end
end
