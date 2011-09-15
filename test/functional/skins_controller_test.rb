require 'test_helper'

class SkinsControllerTest < ActionController::TestCase
  test "should get get" do
    get :get
    assert_response :success
  end

end
