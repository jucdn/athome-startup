require 'test_helper'

class PerksControllerTest < ActionDispatch::IntegrationTest
  setup do
    @perk = perks(:one)
  end

  test "should get index" do
    get perks_url
    assert_response :success
  end

  test "should get new" do
    get new_perk_url
    assert_response :success
  end

  test "should create perk" do
    assert_difference('Perk.count') do
      post perks_url, params: { perk: { description: @perk.description, name: @perk.name, offer: @perk.offer, url: @perk.url } }
    end

    assert_redirected_to perk_url(Perk.last)
  end

  test "should show perk" do
    get perk_url(@perk)
    assert_response :success
  end

  test "should get edit" do
    get edit_perk_url(@perk)
    assert_response :success
  end

  test "should update perk" do
    patch perk_url(@perk), params: { perk: { description: @perk.description, name: @perk.name, offer: @perk.offer, url: @perk.url } }
    assert_redirected_to perk_url(@perk)
  end

  test "should destroy perk" do
    assert_difference('Perk.count', -1) do
      delete perk_url(@perk)
    end

    assert_redirected_to perks_url
  end
end
