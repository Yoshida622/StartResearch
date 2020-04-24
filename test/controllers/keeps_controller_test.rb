require 'test_helper'

class KeepsControllerTest < ActionDispatch::IntegrationTest
  test 'should get index' do
    get keeps_index_url
    assert_response :success
  end
end
