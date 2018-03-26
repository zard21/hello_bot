require 'test_helper'

class TarotAnswersControllerTest < ActionDispatch::IntegrationTest
  setup do
    @tarot_answer = tarot_answers(:one)
  end

  test "should get index" do
    get tarot_answers_url
    assert_response :success
  end

  test "should get new" do
    get new_tarot_answer_url
    assert_response :success
  end

  test "should create tarot_answer" do
    assert_difference('TarotAnswer.count') do
      post tarot_answers_url, params: { tarot_answer: { content: @tarot_answer.content, next_bot_id: @tarot_answer.next_bot_id } }
    end

    assert_redirected_to tarot_answer_url(TarotAnswer.last)
  end

  test "should show tarot_answer" do
    get tarot_answer_url(@tarot_answer)
    assert_response :success
  end

  test "should get edit" do
    get edit_tarot_answer_url(@tarot_answer)
    assert_response :success
  end

  test "should update tarot_answer" do
    patch tarot_answer_url(@tarot_answer), params: { tarot_answer: { content: @tarot_answer.content, next_bot_id: @tarot_answer.next_bot_id } }
    assert_redirected_to tarot_answer_url(@tarot_answer)
  end

  test "should destroy tarot_answer" do
    assert_difference('TarotAnswer.count', -1) do
      delete tarot_answer_url(@tarot_answer)
    end

    assert_redirected_to tarot_answers_url
  end
end
