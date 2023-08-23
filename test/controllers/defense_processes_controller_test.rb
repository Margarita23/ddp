require "test_helper"

class DefenseProcessesControllerTest < ActionDispatch::IntegrationTest
  setup do
    @defense_process = defense_processes(:one)
  end

  test "should get index" do
    get defense_processes_url
    assert_response :success
  end

  test "should get new" do
    get new_defense_process_url
    assert_response :success
  end

  test "should create defense_process" do
    assert_difference("DefenseProcess.count") do
      post defense_processes_url, params: { defense_process: {  } }
    end

    assert_redirected_to defense_process_url(DefenseProcess.last)
  end

  test "should show defense_process" do
    get defense_process_url(@defense_process)
    assert_response :success
  end

  test "should get edit" do
    get edit_defense_process_url(@defense_process)
    assert_response :success
  end

  test "should update defense_process" do
    patch defense_process_url(@defense_process), params: { defense_process: {  } }
    assert_redirected_to defense_process_url(@defense_process)
  end

  test "should destroy defense_process" do
    assert_difference("DefenseProcess.count", -1) do
      delete defense_process_url(@defense_process)
    end

    assert_redirected_to defense_processes_url
  end
end
