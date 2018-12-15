require 'test_helper'

class StartupsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @startup = startups(:one)
  end

  test "should get index" do
    get startups_url
    assert_response :success
  end

  test "should get new" do
    get new_startup_url
    assert_response :success
  end

  test "should create startup" do
    assert_difference('Startup.count') do
      post startups_url, params: { startup: {  } }
    end

    assert_redirected_to startup_url(Startup.last)
  end

  test "should show startup" do
    get startup_url(@startup)
    assert_response :success
  end

  test "should get edit" do
    get edit_startup_url(@startup)
    assert_response :success
  end

  test "should update startup" do
    patch startup_url(@startup), params: { startup: {  } }
    assert_redirected_to startup_url(@startup)
  end

  test "should destroy startup" do
    assert_difference('Startup.count', -1) do
      delete startup_url(@startup)
    end

    assert_redirected_to startups_url
  end
end
