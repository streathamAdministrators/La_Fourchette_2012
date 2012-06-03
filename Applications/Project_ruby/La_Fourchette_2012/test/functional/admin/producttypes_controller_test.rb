require 'test_helper'

class Admin::ProducttypesControllerTest < ActionController::TestCase
  setup do
    @admin_producttype = admin_producttypes(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:admin_producttypes)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create admin_producttype" do
    assert_difference('Admin::Producttype.count') do
      post :create, admin_producttype: {  }
    end

    assert_redirected_to admin_producttype_path(assigns(:admin_producttype))
  end

  test "should show admin_producttype" do
    get :show, id: @admin_producttype
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @admin_producttype
    assert_response :success
  end

  test "should update admin_producttype" do
    put :update, id: @admin_producttype, admin_producttype: {  }
    assert_redirected_to admin_producttype_path(assigns(:admin_producttype))
  end

  test "should destroy admin_producttype" do
    assert_difference('Admin::Producttype.count', -1) do
      delete :destroy, id: @admin_producttype
    end

    assert_redirected_to admin_producttypes_path
  end
end
