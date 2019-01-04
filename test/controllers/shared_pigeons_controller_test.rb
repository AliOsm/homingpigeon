require 'test_helper'

class SharedPigeonsControllerTest < ActionDispatch::IntegrationTest
  test "should get new" do
    get shared_pigeons_new_url
    assert_response :success
  end

  test "should get create" do
    get shared_pigeons_create_url
    assert_response :success
  end

  test "should get destroy" do
    get shared_pigeons_destroy_url
    assert_response :success
  end

end
