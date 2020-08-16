require 'test_helper'

class Members::OrdersControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get members_orders_index_url
    assert_response :success
  end

  test "should get show" do
    get members_orders_show_url
    assert_response :success
  end

  test "should get new" do
    get members_orders_new_url
    assert_response :success
  end

  test "should get confirm" do
    get members_orders_confirm_url
    assert_response :success
  end

  test "should get success" do
    get members_orders_success_url
    assert_response :success
  end

end
