require "test_helper"

class CartSessionsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @cart_session = cart_sessions(:one)
  end

  test "should get index" do
    get cart_sessions_url
    assert_response :success
  end

  test "should get new" do
    get new_cart_session_url
    assert_response :success
  end

  test "should create cart_session" do
    assert_difference("CartSession.count") do
      post cart_sessions_url, params: { cart_session: {  } }
    end

    assert_redirected_to cart_session_url(CartSession.last)
  end

  test "should show cart_session" do
    get cart_session_url(@cart_session)
    assert_response :success
  end

  test "should get edit" do
    get edit_cart_session_url(@cart_session)
    assert_response :success
  end

  test "should update cart_session" do
    patch cart_session_url(@cart_session), params: { cart_session: {  } }
    assert_redirected_to cart_session_url(@cart_session)
  end

  test "should destroy cart_session" do
    assert_difference("CartSession.count", -1) do
      delete cart_session_url(@cart_session)
    end

    assert_redirected_to cart_sessions_url
  end
end
