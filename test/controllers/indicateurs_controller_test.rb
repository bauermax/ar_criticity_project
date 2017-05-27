require 'test_helper'

class IndicateursControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get indicateurs_index_url
    assert_response :success
  end

end
