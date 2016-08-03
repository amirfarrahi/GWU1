require 'test_helper'

class EdgemetaControllerTest < ActionDispatch::IntegrationTest
  setup do
    @edgemetum = edgemeta(:one)
  end

  test "should get index" do
    get edgemeta_url, as: :json
    assert_response :success
  end

  test "should create edgemetum" do
    assert_difference('Edgemetum.count') do
      post edgemeta_url, params: { edgemetum: { condition_id: @edgemetum.condition_id, cost: @edgemetum.cost, edge_id: @edgemetum.edge_id, mode_id: @edgemetum.mode_id } }, as: :json
    end

    assert_response 201
  end

  test "should show edgemetum" do
    get edgemetum_url(@edgemetum), as: :json
    assert_response :success
  end

  test "should update edgemetum" do
    patch edgemetum_url(@edgemetum), params: { edgemetum: { condition_id: @edgemetum.condition_id, cost: @edgemetum.cost, edge_id: @edgemetum.edge_id, mode_id: @edgemetum.mode_id } }, as: :json
    assert_response 200
  end

  test "should destroy edgemetum" do
    assert_difference('Edgemetum.count', -1) do
      delete edgemetum_url(@edgemetum), as: :json
    end

    assert_response 204
  end
end
