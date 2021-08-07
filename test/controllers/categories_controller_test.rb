require "test_helper"
#functional test is the test of actions in the controller
#to run controller test we can do rails test 'path' -> test/controllers

class CategoriesControllerTest < ActionDispatch::IntegrationTest
  setup do
    @category = Category.create(name: "sports")
    @admin_user = User.create(username: "admin", email: "admin@example.com", password: "adminadmin", admin: true)
  end

  test "should get index" do
    get categories_url
    assert_response :success
  end

  test "should get new" do
    sign_in_as(@admin_user)
    get new_category_url
    assert_response :success
  end

  test "should create category" do
    sign_in_as(@admin_user)
    # we want to see a change in the number of category when the category is created
    # we want to see the different by one 
    assert_difference('Category.count', 1) do
      # post request with the specific params
      post categories_url, params: { category: { name: "Travel" } }
    end
    # redirect to the last category
    assert_redirected_to category_url(Category.last)
  end 


  test "should not create category if not admin" do
    # we want to see a change in the number of category when the category is created
    # we want to see the different by one 
    assert_no_difference('Category.count') do
      # post request with the specific params
      post categories_url, params: { category: { name: "Travel" } }
    end
    # redirect to the last category
    assert_redirected_to categories_url
  end

  test "should show category" do
    get category_url(@category)
    assert_response :success
  end

  # test "should get edit" do
  #   get edit_category_url(@category)
  #   assert_response :success
  # end

  # test "should update category" do
  #   patch category_url(@category), params: { category: {  } }
  #   assert_redirected_to category_url(@category)
  # end

  # test "should destroy category" do
  #   assert_difference('Category.count', -1) do
  #     delete category_url(@category)
  #   end

  #   assert_redirected_to categories_url
  # end
end
