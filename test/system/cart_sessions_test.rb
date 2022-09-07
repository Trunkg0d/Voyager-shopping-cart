require "application_system_test_case"

class CartSessionsTest < ApplicationSystemTestCase
  setup do
    @cart_session = cart_sessions(:one)
  end

  test "visiting the index" do
    visit cart_sessions_url
    assert_selector "h1", text: "Cart sessions"
  end

  test "should create cart session" do
    visit cart_sessions_url
    click_on "New cart session"

    click_on "Create Cart session"

    assert_text "Cart session was successfully created"
    click_on "Back"
  end

  test "should update Cart session" do
    visit cart_session_url(@cart_session)
    click_on "Edit this cart session", match: :first

    click_on "Update Cart session"

    assert_text "Cart session was successfully updated"
    click_on "Back"
  end

  test "should destroy Cart session" do
    visit cart_session_url(@cart_session)
    click_on "Destroy this cart session", match: :first

    assert_text "Cart session was successfully destroyed"
  end
end
