require 'test_helper'

class VarientsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @varient = varients(:one)
  end

  test "should get index" do
    get varients_url
    assert_response :success
  end

  test "should get new" do
    get new_varient_url
    assert_response :success
  end

  test "should create varient" do
    assert_difference('Varient.count') do
      post varients_url, params: { varient: { color: @varient.color, material: @varient.material, size: @varient.size } }
    end

    assert_redirected_to varient_url(Varient.last)
  end

  test "should show varient" do
    get varient_url(@varient)
    assert_response :success
  end

  test "should get edit" do
    get edit_varient_url(@varient)
    assert_response :success
  end

  test "should update varient" do
    patch varient_url(@varient), params: { varient: { color: @varient.color, material: @varient.material, size: @varient.size } }
    assert_redirected_to varient_url(@varient)
  end

  test "should destroy varient" do
    assert_difference('Varient.count', -1) do
      delete varient_url(@varient)
    end

    assert_redirected_to varients_url
  end
end
