require 'test_helper'

class UserfeedsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @userfeed = userfeeds(:one)
  end

  test "should get index" do
    get userfeeds_url, as: :json
    assert_response :success
  end

  test "should create userfeed" do
    assert_difference('Userfeed.count') do
      post userfeeds_url, params: { userfeed: { answer_id: @userfeed.answer_id, game_id: @userfeed.game_id, question_id: @userfeed.question_id, user_id: @userfeed.user_id } }, as: :json
    end

    assert_response 201
  end

  test "should show userfeed" do
    get userfeed_url(@userfeed), as: :json
    assert_response :success
  end

  test "should update userfeed" do
    patch userfeed_url(@userfeed), params: { userfeed: { answer_id: @userfeed.answer_id, game_id: @userfeed.game_id, question_id: @userfeed.question_id, user_id: @userfeed.user_id } }, as: :json
    assert_response 200
  end

  test "should destroy userfeed" do
    assert_difference('Userfeed.count', -1) do
      delete userfeed_url(@userfeed), as: :json
    end

    assert_response 204
  end
end
