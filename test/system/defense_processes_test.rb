require "application_system_test_case"

class DefenseProcessesTest < ApplicationSystemTestCase
  setup do
    @defense_process = defense_processes(:one)
  end

  test "visiting the index" do
    visit defense_processes_url
    assert_selector "h1", text: "Defense processes"
  end

  test "should create defense process" do
    visit defense_processes_url
    click_on "New defense process"

    click_on "Create Defense process"

    assert_text "Defense process was successfully created"
    click_on "Back"
  end

  test "should update Defense process" do
    visit defense_process_url(@defense_process)
    click_on "Edit this defense process", match: :first

    click_on "Update Defense process"

    assert_text "Defense process was successfully updated"
    click_on "Back"
  end

  test "should destroy Defense process" do
    visit defense_process_url(@defense_process)
    click_on "Destroy this defense process", match: :first

    assert_text "Defense process was successfully destroyed"
  end
end
