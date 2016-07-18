require 'test_helper'

class EdgesControllerTest < ActionDispatch::IntegrationTest
  setup do
    @edge = edges(:one)
  end

  test "should get index" do
    get edges_url, as: :json
    assert_response :success
  end

  test "should create edge" do
    assert_difference('Edge.count') do
      post edges_url, params: { edge: { desc: @edge.desc, name: @edge.name } }, as: :json
    end

    assert_response 201
  end

  test "should show edge" do
    get edge_url(@edge), as: :json
    assert_response :success
  end

  test "should update edge" do
    patch edge_url(@edge), params: { edge: { desc: @edge.desc, name: @edge.name } }, as: :json
    assert_response 200
  end

  test "should destroy edge" do
    assert_difference('Edge.count', -1) do
      delete edge_url(@edge), as: :json
    end

    assert_response 204
  end
end
