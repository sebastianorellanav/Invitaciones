require "application_system_test_case"

class TypeStatesTest < ApplicationSystemTestCase
  setup do
    @type_state = type_states(:one)
  end

  test "visiting the index" do
    visit type_states_url
    assert_selector "h1", text: "Type states"
  end

  test "should create type state" do
    visit type_states_url
    click_on "New type state"

    fill_in "Name", with: @type_state.name
    click_on "Create Type state"

    assert_text "Type state was successfully created"
    click_on "Back"
  end

  test "should update Type state" do
    visit type_state_url(@type_state)
    click_on "Edit this type state", match: :first

    fill_in "Name", with: @type_state.name
    click_on "Update Type state"

    assert_text "Type state was successfully updated"
    click_on "Back"
  end

  test "should destroy Type state" do
    visit type_state_url(@type_state)
    click_on "Destroy this type state", match: :first

    assert_text "Type state was successfully destroyed"
  end
end
