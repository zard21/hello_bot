require 'test_helper'

class SajuBotsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @saju_bot = saju_bots(:one)
  end

  test "should get index" do
    get saju_bots_url
    assert_response :success
  end

  test "should get new" do
    get new_saju_bot_url
    assert_response :success
  end

  test "should create saju_bot" do
    assert_difference('SajuBot.count') do
      post saju_bots_url, params: { saju_bot: { ans_type: @saju_bot.ans_type, content: @saju_bot.content, is_init: @saju_bot.is_init } }
    end

    assert_redirected_to saju_bot_url(SajuBot.last)
  end

  test "should show saju_bot" do
    get saju_bot_url(@saju_bot)
    assert_response :success
  end

  test "should get edit" do
    get edit_saju_bot_url(@saju_bot)
    assert_response :success
  end

  test "should update saju_bot" do
    patch saju_bot_url(@saju_bot), params: { saju_bot: { ans_type: @saju_bot.ans_type, content: @saju_bot.content, is_init: @saju_bot.is_init } }
    assert_redirected_to saju_bot_url(@saju_bot)
  end

  test "should destroy saju_bot" do
    assert_difference('SajuBot.count', -1) do
      delete saju_bot_url(@saju_bot)
    end

    assert_redirected_to saju_bots_url
  end
end
