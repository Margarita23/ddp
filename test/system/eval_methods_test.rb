require "application_system_test_case"

class EvalMethodsTest < ApplicationSystemTestCase
  setup do
    @eval_method = eval_methods(:one)
  end

  test "visiting the index" do
    visit eval_methods_url
    assert_selector "h1", text: "Eval methods"
  end

  test "should create eval method" do
    visit eval_methods_url
    click_on "New eval method"

    fill_in "Name", with: @eval_method.name
    click_on "Create Eval method"

    assert_text "Eval method was successfully created"
    click_on "Back"
  end

  test "should update Eval method" do
    visit eval_method_url(@eval_method)
    click_on "Edit this eval method", match: :first

    fill_in "Name", with: @eval_method.name
    click_on "Update Eval method"

    assert_text "Eval method was successfully updated"
    click_on "Back"
  end

  test "should destroy Eval method" do
    visit eval_method_url(@eval_method)
    click_on "Destroy this eval method", match: :first

    assert_text "Eval method was successfully destroyed"
  end
end
