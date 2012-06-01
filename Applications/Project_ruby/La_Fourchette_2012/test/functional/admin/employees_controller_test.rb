require 'test_helper'

class Admin::EmployeesControllerTest < ActionController::TestCase
  setup do
    @admin_employee = admin_employees(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:admin_employees)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create admin_employee" do
    assert_difference('Admin::Employee.count') do
      post :create, admin_employee: @admin_employee.attributes
    end

    assert_redirected_to admin_employee_path(assigns(:admin_employee))
  end

  test "should show admin_employee" do
    get :show, id: @admin_employee
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @admin_employee
    assert_response :success
  end

  test "should update admin_employee" do
    put :update, id: @admin_employee, admin_employee: @admin_employee.attributes
    assert_redirected_to admin_employee_path(assigns(:admin_employee))
  end

  test "should destroy admin_employee" do
    assert_difference('Admin::Employee.count', -1) do
      delete :destroy, id: @admin_employee
    end

    assert_redirected_to admin_employees_path
  end
end
