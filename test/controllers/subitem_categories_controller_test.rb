require 'test_helper'

class SubitemCategoriesControllerTest < ActionDispatch::IntegrationTest
  setup do
    @subitem_category = subitem_categories(:one)
  end

  test "should get index" do
    get subitem_categories_url
    assert_response :success
  end

  test "should get new" do
    get new_subitem_category_url
    assert_response :success
  end

  test "should create subitem_category" do
    assert_difference('SubitemCategory.count') do
      post subitem_categories_url, params: { subitem_category: { name: @subitem_category.name } }
    end

    assert_redirected_to subitem_category_url(SubitemCategory.last)
  end

  test "should show subitem_category" do
    get subitem_category_url(@subitem_category)
    assert_response :success
  end

  test "should get edit" do
    get edit_subitem_category_url(@subitem_category)
    assert_response :success
  end

  test "should update subitem_category" do
    patch subitem_category_url(@subitem_category), params: { subitem_category: { name: @subitem_category.name } }
    assert_redirected_to subitem_category_url(@subitem_category)
  end

  test "should destroy subitem_category" do
    assert_difference('SubitemCategory.count', -1) do
      delete subitem_category_url(@subitem_category)
    end

    assert_redirected_to subitem_categories_url
  end
end
