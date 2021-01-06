require 'test_helper'

class DeliveryBoysControllerTest < ActionDispatch::IntegrationTest
  setup do
    @delivery_boy = delivery_boys(:one)
  end

  test "should get index" do
    get delivery_boys_url
    assert_response :success
  end

  test "should get new" do
    get new_delivery_boy_url
    assert_response :success
  end

  test "should create delivery_boy" do
    assert_difference('DeliveryBoy.count') do
      post delivery_boys_url, params: { delivery_boy: { address: @delivery_boy.address, name: @delivery_boy.name, number: @delivery_boy.number } }
    end

    assert_redirected_to delivery_boy_url(DeliveryBoy.last)
  end

  test "should show delivery_boy" do
    get delivery_boy_url(@delivery_boy)
    assert_response :success
  end

  test "should get edit" do
    get edit_delivery_boy_url(@delivery_boy)
    assert_response :success
  end

  test "should update delivery_boy" do
    patch delivery_boy_url(@delivery_boy), params: { delivery_boy: { address: @delivery_boy.address, name: @delivery_boy.name, number: @delivery_boy.number } }
    assert_redirected_to delivery_boy_url(@delivery_boy)
  end

  test "should destroy delivery_boy" do
    assert_difference('DeliveryBoy.count', -1) do
      delete delivery_boy_url(@delivery_boy)
    end

    assert_redirected_to delivery_boys_url
  end
end
