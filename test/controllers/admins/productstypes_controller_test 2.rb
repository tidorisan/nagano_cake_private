require 'test_helper'

class Admins::ProductstypesControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get admins_productstypes_index_url
    assert_response :success
  end

  test "should get edit" do
    get admins_productstypes_edit_url
    assert_response :success
  end

end
