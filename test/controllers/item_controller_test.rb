require 'test_helper'

class ItemControllerTest < ActionController::TestCase
  test "should get showItem" do
    get :showItem
    assert_response :success
  end

  test "should get createItem" do
    get :createItem
    assert_response :success
  end

  test "should get searchItem" do
    get :searchItem
    assert_response :success
  end

  test "should get deleteItem" do
    get :deleteItem
    assert_response :success
  end

  test "should get editItem" do
    get :editItem
    assert_response :success
  end

end
