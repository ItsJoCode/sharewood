require "test_helper"

class Customer::SalesControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get customer_sales_index_url
    assert_response :success
  end

  test "should get show" do
    get customer_sales_show_url
    assert_response :success
  end
end
