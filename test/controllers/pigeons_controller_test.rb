require 'test_helper'

class PigeonsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @pigeon = pigeons(:one)
  end

  test "should get index" do
    get pigeons_url
    assert_response :success
  end

  test "should get new" do
    get new_pigeon_url
    assert_response :success
  end

  test "should create pigeon" do
    assert_difference('Pigeon.count') do
      post pigeons_url, params: { pigeon: { description: @pigeon.description, name: @pigeon.name, token: @pigeon.token, user_id: @pigeon.user_id } }
    end

    assert_redirected_to pigeon_url(Pigeon.last)
  end

  test "should show pigeon" do
    get pigeon_url(@pigeon)
    assert_response :success
  end

  test "should get edit" do
    get edit_pigeon_url(@pigeon)
    assert_response :success
  end

  test "should update pigeon" do
    patch pigeon_url(@pigeon), params: { pigeon: { description: @pigeon.description, name: @pigeon.name, token: @pigeon.token, user_id: @pigeon.user_id } }
    assert_redirected_to pigeon_url(@pigeon)
  end

  test "should destroy pigeon" do
    assert_difference('Pigeon.count', -1) do
      delete pigeon_url(@pigeon)
    end

    assert_redirected_to pigeons_url
  end
end
