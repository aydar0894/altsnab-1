require 'test_helper'

class CategoryFieldsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @category_field = category_fields(:one)
  end

  test "should get index" do
    get category_fields_url
    assert_response :success
  end

  test "should get new" do
    get new_category_field_url
    assert_response :success
  end

  test "should create category_field" do
    assert_difference('CategoryField.count') do
      post category_fields_url, params: { category_field: { category_id: @category_field.category_id, field_id: @category_field.field_id } }
    end

    assert_redirected_to category_field_url(CategoryField.last)
  end

  test "should show category_field" do
    get category_field_url(@category_field)
    assert_response :success
  end

  test "should get edit" do
    get edit_category_field_url(@category_field)
    assert_response :success
  end

  test "should update category_field" do
    patch category_field_url(@category_field), params: { category_field: { category_id: @category_field.category_id, field_id: @category_field.field_id } }
    assert_redirected_to category_field_url(@category_field)
  end

  test "should destroy category_field" do
    assert_difference('CategoryField.count', -1) do
      delete category_field_url(@category_field)
    end

    assert_redirected_to category_fields_url
  end
end
