require 'test_helper'

class ZakladyControllerTest < ActionController::TestCase
  test "should get nowy" do
    get :nowy
    assert_response :success
  end

end
