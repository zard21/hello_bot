require 'test_helper'

class SajuAnswersControllerTest < ActionDispatch::IntegrationTest
  setup do
    @saju_answer = saju_answers(:one)
  end

  test "should get index" do
    get saju_answers_url
    assert_response :success
  end

  test "should get new" do
    get new_saju_answer_url
    assert_response :success
  end

  test "should create saju_answer" do
    assert_difference('SajuAnswer.count') do
      post saju_answers_url, params: { saju_answer: { content: @saju_answer.content, next_bot_id: @saju_answer.next_bot_id } }
    end

    assert_redirected_to saju_answer_url(SajuAnswer.last)
  end

  test "should show saju_answer" do
    get saju_answer_url(@saju_answer)
    assert_response :success
  end

  test "should get edit" do
    get edit_saju_answer_url(@saju_answer)
    assert_response :success
  end

  test "should update saju_answer" do
    patch saju_answer_url(@saju_answer), params: { saju_answer: { content: @saju_answer.content, next_bot_id: @saju_answer.next_bot_id } }
    assert_redirected_to saju_answer_url(@saju_answer)
  end

  test "should destroy saju_answer" do
    assert_difference('SajuAnswer.count', -1) do
      delete saju_answer_url(@saju_answer)
    end

    assert_redirected_to saju_answers_url
  end
end
