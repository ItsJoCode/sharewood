require "test_helper"

class Owner::SalesControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get owner_sales_index_url
    assert_response :success
  end

  test "should get show" do
    get owner_sales_show_url
    assert_response :success
  end

  test "should get new" do
    get owner_sales_new_url
    assert_response :success
  end
end
