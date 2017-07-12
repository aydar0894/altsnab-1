require 'test_helper'

class SubitemFieldsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @subitem_field = subitem_fields(:one)
  end

  test "should get index" do
    get subitem_fields_url
    assert_response :success
  end

  test "should get new" do
    get new_subitem_field_url
    assert_response :success
  end

  test "should create subitem_field" do
    assert_difference('SubitemField.count') do
      post subitem_fields_url, params: { subitem_field: { description: @subitem_field.description, name: @subitem_field.name } }
    end

    assert_redirected_to subitem_field_url(SubitemField.last)
  end

  test "should show subitem_field" do
    get subitem_field_url(@subitem_field)
    assert_response :success
  end

  test "should get edit" do
    get edit_subitem_field_url(@subitem_field)
    assert_response :success
  end

  test "should update subitem_field" do
    patch subitem_field_url(@subitem_field), params: { subitem_field: { description: @subitem_field.description, name: @subitem_field.name } }
    assert_redirected_to subitem_field_url(@subitem_field)
  end

  test "should destroy subitem_field" do
    assert_difference('SubitemField.count', -1) do
      delete subitem_field_url(@subitem_field)
    end

    assert_redirected_to subitem_fields_url
  end
end
