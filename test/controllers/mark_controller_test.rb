require "test_helper"

class MarkControllerTest < ActionDispatch::IntegrationTest
  test "should get create" do
    get mark_create_url
    assert_response :success
  end

  test "should get edit" do
    get mark_edit_url
    assert_response :success
  end

  test "should get delete" do
    get mark_delete_url
    assert_response :success
  end
end
