require "application_system_test_case"

class DiplomasTest < ApplicationSystemTestCase
  setup do
    @diploma = diplomas(:one)
  end

  test "visiting the index" do
    visit diplomas_url
    assert_selector "h1", text: "Diplomas"
  end

  test "should create diploma" do
    visit diplomas_url
    click_on "New diploma"

    fill_in "Language", with: @diploma.language
    fill_in "Mark", with: @diploma.mark
    fill_in "Pages", with: @diploma.pages
    fill_in "Presentation", with: @diploma.presentation
    fill_in "Sample type", with: @diploma.sample_type
    fill_in "Student", with: @diploma.student_id
    fill_in "Theme", with: @diploma.theme
    click_on "Create Diploma"

    assert_text "Diploma was successfully created"
    click_on "Back"
  end

  test "should update Diploma" do
    visit diploma_url(@diploma)
    click_on "Edit this diploma", match: :first

    fill_in "Language", with: @diploma.language
    fill_in "Mark", with: @diploma.mark
    fill_in "Pages", with: @diploma.pages
    fill_in "Presentation", with: @diploma.presentation
    fill_in "Sample type", with: @diploma.sample_type
    fill_in "Student", with: @diploma.student_id
    fill_in "Theme", with: @diploma.theme
    click_on "Update Diploma"

    assert_text "Diploma was successfully updated"
    click_on "Back"
  end

  test "should destroy Diploma" do
    visit diploma_url(@diploma)
    click_on "Destroy this diploma", match: :first

    assert_text "Diploma was successfully destroyed"
  end
end
