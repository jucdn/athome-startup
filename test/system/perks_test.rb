require "application_system_test_case"

class PerksTest < ApplicationSystemTestCase
  setup do
    @perk = perks(:one)
  end

  test "visiting the index" do
    visit perks_url
    assert_selector "h1", text: "Perks"
  end

  test "creating a Perk" do
    visit perks_url
    click_on "New Perk"

    fill_in "Description", with: @perk.description
    fill_in "Name", with: @perk.name
    fill_in "Offer", with: @perk.offer
    fill_in "Url", with: @perk.url
    click_on "Create Perk"

    assert_text "Perk was successfully created"
    click_on "Back"
  end

  test "updating a Perk" do
    visit perks_url
    click_on "Edit", match: :first

    fill_in "Description", with: @perk.description
    fill_in "Name", with: @perk.name
    fill_in "Offer", with: @perk.offer
    fill_in "Url", with: @perk.url
    click_on "Update Perk"

    assert_text "Perk was successfully updated"
    click_on "Back"
  end

  test "destroying a Perk" do
    visit perks_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Perk was successfully destroyed"
  end
end
