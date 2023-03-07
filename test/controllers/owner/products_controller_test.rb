require "test_helper"

class Owner::ProductsControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get owner_products_index_url
    assert_response :success
  end

  test "should get show" do
    get owner_products_show_url
    assert_response :success
  end

  test "should get new" do
    get owner_products_new_url
    assert_response :success
  end
end
