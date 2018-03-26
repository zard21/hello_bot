require 'test_helper'

class TarotBotsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @tarot_bot = tarot_bots(:one)
  end

  test "should get index" do
    get tarot_bots_url
    assert_response :success
  end

  test "should get new" do
    get new_tarot_bot_url
    assert_response :success
  end

  test "should create tarot_bot" do
    assert_difference('TarotBot.count') do
      post tarot_bots_url, params: { tarot_bot: { ans_type: @tarot_bot.ans_type, content: @tarot_bot.content, is_init: @tarot_bot.is_init } }
    end

    assert_redirected_to tarot_bot_url(TarotBot.last)
  end

  test "should show tarot_bot" do
    get tarot_bot_url(@tarot_bot)
    assert_response :success
  end

  test "should get edit" do
    get edit_tarot_bot_url(@tarot_bot)
    assert_response :success
  end

  test "should update tarot_bot" do
    patch tarot_bot_url(@tarot_bot), params: { tarot_bot: { ans_type: @tarot_bot.ans_type, content: @tarot_bot.content, is_init: @tarot_bot.is_init } }
    assert_redirected_to tarot_bot_url(@tarot_bot)
  end

  test "should destroy tarot_bot" do
    assert_difference('TarotBot.count', -1) do
      delete tarot_bot_url(@tarot_bot)
    end

    assert_redirected_to tarot_bots_url
  end
end
