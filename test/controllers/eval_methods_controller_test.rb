require "test_helper"

class EvalMethodsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @eval_method = eval_methods(:one)
  end

  test "should get index" do
    get eval_methods_url
    assert_response :success
  end

  test "should get new" do
    get new_eval_method_url
    assert_response :success
  end

  test "should create eval_method" do
    assert_difference("EvalMethod.count") do
      post eval_methods_url, params: { eval_method: { name: @eval_method.name } }
    end

    assert_redirected_to eval_method_url(EvalMethod.last)
  end

  test "should show eval_method" do
    get eval_method_url(@eval_method)
    assert_response :success
  end

  test "should get edit" do
    get edit_eval_method_url(@eval_method)
    assert_response :success
  end

  test "should update eval_method" do
    patch eval_method_url(@eval_method), params: { eval_method: { name: @eval_method.name } }
    assert_redirected_to eval_method_url(@eval_method)
  end

  test "should destroy eval_method" do
    assert_difference("EvalMethod.count", -1) do
      delete eval_method_url(@eval_method)
    end

    assert_redirected_to eval_methods_url
  end
end
