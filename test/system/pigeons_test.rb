require "application_system_test_case"

class PigeonsTest < ApplicationSystemTestCase
  setup do
    @pigeon = pigeons(:one)
  end

  test "visiting the index" do
    visit pigeons_url
    assert_selector "h1", text: "Pigeons"
  end

  test "creating a Pigeon" do
    visit pigeons_url
    click_on "New Pigeon"

    fill_in "Description", with: @pigeon.description
    fill_in "Name", with: @pigeon.name
    fill_in "Token", with: @pigeon.token
    fill_in "User", with: @pigeon.user_id
    click_on "Create Pigeon"

    assert_text "Pigeon was successfully created"
    click_on "Back"
  end

  test "updating a Pigeon" do
    visit pigeons_url
    click_on "Edit", match: :first

    fill_in "Description", with: @pigeon.description
    fill_in "Name", with: @pigeon.name
    fill_in "Token", with: @pigeon.token
    fill_in "User", with: @pigeon.user_id
    click_on "Update Pigeon"

    assert_text "Pigeon was successfully updated"
    click_on "Back"
  end

  test "destroying a Pigeon" do
    visit pigeons_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Pigeon was successfully destroyed"
  end
end
