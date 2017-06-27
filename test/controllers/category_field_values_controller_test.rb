require 'test_helper'

class CategoryFieldValuesControllerTest < ActionDispatch::IntegrationTest
  setup do
    @category_field_value = category_field_values(:one)
  end

  test "should get index" do
    get category_field_values_url
    assert_response :success
  end

  test "should get new" do
    get new_category_field_value_url
    assert_response :success
  end

  test "should create category_field_value" do
    assert_difference('CategoryFieldValue.count') do
      post category_field_values_url, params: { category_field_value: { category_field_id: @category_field_value.category_field_id, item_id: @category_field_value.item_id, value: @category_field_value.value } }
    end

    assert_redirected_to category_field_value_url(CategoryFieldValue.last)
  end

  test "should show category_field_value" do
    get category_field_value_url(@category_field_value)
    assert_response :success
  end

  test "should get edit" do
    get edit_category_field_value_url(@category_field_value)
    assert_response :success
  end

  test "should update category_field_value" do
    patch category_field_value_url(@category_field_value), params: { category_field_value: { category_field_id: @category_field_value.category_field_id, item_id: @category_field_value.item_id, value: @category_field_value.value } }
    assert_redirected_to category_field_value_url(@category_field_value)
  end

  test "should destroy category_field_value" do
    assert_difference('CategoryFieldValue.count', -1) do
      delete category_field_value_url(@category_field_value)
    end

    assert_redirected_to category_field_values_url
  end
end
