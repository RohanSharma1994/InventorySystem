require 'test_helper'

class SaleControllerTest < ActionController::TestCase
  test "should get create" do
    get :create
    assert_response :success
  end

  test "should get edit" do
    get :edit
    assert_response :success
  end

  test "should get delete" do
    get :delete
    assert_response :success
  end

  test "should get index" do
    get :index
    assert_response :success
  end

  test "should get edit_view" do
    get :edit_view
    assert_response :success
  end

end
