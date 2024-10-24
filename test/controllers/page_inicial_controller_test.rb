require "test_helper"

class PageInicialControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get page_inicial_index_url
    assert_response :success
  end
end
