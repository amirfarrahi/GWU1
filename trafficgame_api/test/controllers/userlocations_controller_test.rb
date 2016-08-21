require 'test_helper'

class UserlocationsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @userlocation = userlocations(:one)
  end

  test "should get index" do
    get userlocations_url, as: :json
    assert_response :success
  end

  test "should create userlocation" do
    assert_difference('Userlocation.count') do
      post userlocations_url, params: { userlocation: { lat: @userlocation.lat, lon: @userlocation.lon, user_id: @userlocation.user_id } }, as: :json
    end

    assert_response 201
  end

  test "should show userlocation" do
    get userlocation_url(@userlocation), as: :json
    assert_response :success
  end

  test "should update userlocation" do
    patch userlocation_url(@userlocation), params: { userlocation: { lat: @userlocation.lat, lon: @userlocation.lon, user_id: @userlocation.user_id } }, as: :json
    assert_response 200
  end

  test "should destroy userlocation" do
    assert_difference('Userlocation.count', -1) do
      delete userlocation_url(@userlocation), as: :json
    end

    assert_response 204
  end
end
