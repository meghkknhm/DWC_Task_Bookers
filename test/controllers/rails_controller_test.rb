require 'test_helper'

class RailsControllerTest < ActionDispatch::IntegrationTest
  test "should get g" do
    get rails_g_url
    assert_response :success
  end

  test "should get model" do
    get rails_model_url
    assert_response :success
  end

  test "should get Book" do
    get rails_Book_url
    assert_response :success
  end

end
