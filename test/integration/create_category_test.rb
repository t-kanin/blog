require "test_helper"

#integraion is the test of the flow of application, to see that the overall functions are working together

class CreateCategoryTest < ActionDispatch::IntegrationTest
  test "get new category form and create category" do
    get "/categories/new"
    assert_response :success
    assert_difference('Category.count', 1) do  
      post categories_path, params: {category: {name: "Sports"} }
      assert_response :redirect
    end 
    follow_redirect!
    assert_response :success
    # the name sports should show up in the page, want to see it in the body
    assert_match "Sports", response.body
  end


  test "get new category form and reject invalid category submission" do
    get "/categories/new"
    assert_response :success
    assert_no_difference('Category.count') do  
      post categories_path, params: {category: {name: " "} }
    end 
    # check for the div class of alert 
    assert_match 'errors', response.body
    assert_select 'div.alert'
    assert_select 'h4.alert-heading'
  end

end
