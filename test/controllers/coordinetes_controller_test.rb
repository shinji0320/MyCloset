require 'test_helper'

class CoordinetesControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get coordinetes_index_url
    assert_response :success
  end

  test "should get edit" do
    get coordinetes_edit_url
    assert_response :success
  end
end
