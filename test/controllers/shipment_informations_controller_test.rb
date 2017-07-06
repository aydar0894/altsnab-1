require 'test_helper'

class ShipmentInformationsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @shipment_information = shipment_informations(:one)
  end

  test "should get index" do
    get shipment_informations_url
    assert_response :success
  end

  test "should get new" do
    get new_shipment_information_url
    assert_response :success
  end

  test "should create shipment_information" do
    assert_difference('ShipmentInformation.count') do
      post shipment_informations_url, params: { shipment_information: { address: @shipment_information.address, city: @shipment_information.city, country: @shipment_information.country, is_main: @shipment_information.is_main, zip_code: @shipment_information.zip_code } }
    end

    assert_redirected_to shipment_information_url(ShipmentInformation.last)
  end

  test "should show shipment_information" do
    get shipment_information_url(@shipment_information)
    assert_response :success
  end

  test "should get edit" do
    get edit_shipment_information_url(@shipment_information)
    assert_response :success
  end

  test "should update shipment_information" do
    patch shipment_information_url(@shipment_information), params: { shipment_information: { address: @shipment_information.address, city: @shipment_information.city, country: @shipment_information.country, is_main: @shipment_information.is_main, zip_code: @shipment_information.zip_code } }
    assert_redirected_to shipment_information_url(@shipment_information)
  end

  test "should destroy shipment_information" do
    assert_difference('ShipmentInformation.count', -1) do
      delete shipment_information_url(@shipment_information)
    end

    assert_redirected_to shipment_informations_url
  end
end
