require "application_system_test_case"

class SoldItemsTest < ApplicationSystemTestCase
  setup do
    @sold_item = sold_items(:one)
  end

  test "visiting the index" do
    visit sold_items_url
    assert_selector "h1", text: "Sold Items"
  end

  test "creating a Sold item" do
    visit sold_items_url
    click_on "New Sold Item"

    click_on "Create Sold item"

    assert_text "Sold item was successfully created"
    click_on "Back"
  end

  test "updating a Sold item" do
    visit sold_items_url
    click_on "Edit", match: :first

    click_on "Update Sold item"

    assert_text "Sold item was successfully updated"
    click_on "Back"
  end

  test "destroying a Sold item" do
    visit sold_items_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Sold item was successfully destroyed"
  end
end
