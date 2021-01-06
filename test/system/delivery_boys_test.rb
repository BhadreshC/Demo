require "application_system_test_case"

class DeliveryBoysTest < ApplicationSystemTestCase
  setup do
    @delivery_boy = delivery_boys(:one)
  end

  test "visiting the index" do
    visit delivery_boys_url
    assert_selector "h1", text: "Delivery Boys"
  end

  test "creating a Delivery boy" do
    visit delivery_boys_url
    click_on "New Delivery Boy"

    fill_in "Address", with: @delivery_boy.address
    fill_in "Name", with: @delivery_boy.name
    fill_in "Number", with: @delivery_boy.number
    click_on "Create Delivery boy"

    assert_text "Delivery boy was successfully created"
    click_on "Back"
  end

  test "updating a Delivery boy" do
    visit delivery_boys_url
    click_on "Edit", match: :first

    fill_in "Address", with: @delivery_boy.address
    fill_in "Name", with: @delivery_boy.name
    fill_in "Number", with: @delivery_boy.number
    click_on "Update Delivery boy"

    assert_text "Delivery boy was successfully updated"
    click_on "Back"
  end

  test "destroying a Delivery boy" do
    visit delivery_boys_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Delivery boy was successfully destroyed"
  end
end
