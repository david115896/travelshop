require 'test_helper'

class SoldItemsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @sold_item = sold_items(:one)
  end

  test "should get index" do
    get sold_items_url
    assert_response :success
  end

  test "should get new" do
    get new_sold_item_url
    assert_response :success
  end

  test "should create sold_item" do
    assert_difference('SoldItem.count') do
      post sold_items_url, params: { sold_item: {  } }
    end

    assert_redirected_to sold_item_url(SoldItem.last)
  end

  test "should show sold_item" do
    get sold_item_url(@sold_item)
    assert_response :success
  end

  test "should get edit" do
    get edit_sold_item_url(@sold_item)
    assert_response :success
  end

  test "should update sold_item" do
    patch sold_item_url(@sold_item), params: { sold_item: {  } }
    assert_redirected_to sold_item_url(@sold_item)
  end

  test "should destroy sold_item" do
    assert_difference('SoldItem.count', -1) do
      delete sold_item_url(@sold_item)
    end

    assert_redirected_to sold_items_url
  end
end
