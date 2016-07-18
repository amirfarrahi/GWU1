require 'test_helper'

class TravelmodesControllerTest < ActionDispatch::IntegrationTest
  setup do
    @travelmode = travelmodes(:one)
  end

  test "should get index" do
    get travelmodes_url, as: :json
    assert_response :success
  end

  test "should create travelmode" do
    assert_difference('Travelmode.count') do
      post travelmodes_url, params: { travelmode: { desc: @travelmode.desc, name: @travelmode.name } }, as: :json
    end

    assert_response 201
  end

  test "should show travelmode" do
    get travelmode_url(@travelmode), as: :json
    assert_response :success
  end

  test "should update travelmode" do
    patch travelmode_url(@travelmode), params: { travelmode: { desc: @travelmode.desc, name: @travelmode.name } }, as: :json
    assert_response 200
  end

  test "should destroy travelmode" do
    assert_difference('Travelmode.count', -1) do
      delete travelmode_url(@travelmode), as: :json
    end

    assert_response 204
  end
end
