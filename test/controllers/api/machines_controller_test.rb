require 'test_helper'

class Api::MachinesControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get api_machines_index_url
    assert_response :success
  end

end
