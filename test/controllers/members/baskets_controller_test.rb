require 'test_helper'

class Members::BasketsControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get members_baskets_index_url
    assert_response :success
  end

end
