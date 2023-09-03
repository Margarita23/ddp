require "application_system_test_case"

class CommissionsTest < ApplicationSystemTestCase
  setup do
    @commission = commissions(:one)
  end

  test "visiting the index" do
    visit commissions_url
    assert_selector "h1", text: "Commissions"
  end

  test "should create commission" do
    visit commissions_url
    click_on "New commission"

    fill_in "Name", with: @commission.name
    fill_in "Number", with: @commission.number
    click_on "Create Commission"

    assert_text "Commission was successfully created"
    click_on "Back"
  end

  test "should update Commission" do
    visit commission_url(@commission)
    click_on "Edit this commission", match: :first

    fill_in "Name", with: @commission.name
    fill_in "Number", with: @commission.number
    click_on "Update Commission"

    assert_text "Commission was successfully updated"
    click_on "Back"
  end

  test "should destroy Commission" do
    visit commission_url(@commission)
    click_on "Destroy this commission", match: :first

    assert_text "Commission was successfully destroyed"
  end
end
