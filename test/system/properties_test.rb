require "application_system_test_case"

class PropertiesTest < ApplicationSystemTestCase
  setup do
    @property = properties(:one)
  end

  test "visiting the index" do
    visit properties_url
    assert_selector "h1", text: "Properties"
  end

  test "creating a Property" do
    visit properties_url
    click_on "New Property"

    fill_in "Address", with: @property.address
    fill_in "Fee", with: @property.fee
    check "In unit laundry" if @property.in_unit_laundry
    fill_in "Name", with: @property.name
    check "Parking" if @property.parking
    check "Pets allowed" if @property.pets_allowed
    fill_in "Rent", with: @property.rent
    fill_in "Start date", with: @property.start_date
    fill_in "Terms available", with: @property.terms_available
    click_on "Create Property"

    assert_text "Property was successfully created"
    click_on "Back"
  end

  test "updating a Property" do
    visit properties_url
    click_on "Edit", match: :first

    fill_in "Address", with: @property.address
    fill_in "Fee", with: @property.fee
    check "In unit laundry" if @property.in_unit_laundry
    fill_in "Name", with: @property.name
    check "Parking" if @property.parking
    check "Pets allowed" if @property.pets_allowed
    fill_in "Rent", with: @property.rent
    fill_in "Start date", with: @property.start_date
    fill_in "Terms available", with: @property.terms_available
    click_on "Update Property"

    assert_text "Property was successfully updated"
    click_on "Back"
  end

  test "destroying a Property" do
    visit properties_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Property was successfully destroyed"
  end
end
