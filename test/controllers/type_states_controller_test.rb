require "test_helper"

class TypeStatesControllerTest < ActionDispatch::IntegrationTest
  setup do
    @type_state = type_states(:one)
  end

  test "should get index" do
    get type_states_url
    assert_response :success
  end

  test "should get new" do
    get new_type_state_url
    assert_response :success
  end

  test "should create type_state" do
    assert_difference("TypeState.count") do
      post type_states_url, params: { type_state: { name: @type_state.name } }
    end

    assert_redirected_to type_state_url(TypeState.last)
  end

  test "should show type_state" do
    get type_state_url(@type_state)
    assert_response :success
  end

  test "should get edit" do
    get edit_type_state_url(@type_state)
    assert_response :success
  end

  test "should update type_state" do
    patch type_state_url(@type_state), params: { type_state: { name: @type_state.name } }
    assert_redirected_to type_state_url(@type_state)
  end

  test "should destroy type_state" do
    assert_difference("TypeState.count", -1) do
      delete type_state_url(@type_state)
    end

    assert_redirected_to type_states_url
  end
end
