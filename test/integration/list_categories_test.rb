require "test_helper"

class ListCategoriesTest < ActionDispatch::IntegrationTest
  def setup 
    @category_first = Category.create(name: "Sports")
    @category_second = Category.create(name: "Travel")
  end 

  test "should show categories listing" do 
    get '/categories'
    # looking for the match of two links
    assert_select "a[href=?]", category_path(@category_first), text: @category_first.name 
    assert_select "a[href=?]", category_path(@category_second), text: @category_second.name
  end  
end
