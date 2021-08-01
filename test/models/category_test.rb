# this file is auto-generated if you create the model using generator 
# rails test to run all the files in the test folder
# test driven development is when we create a test case and write the base minimum of code to make it passes
# the database run here does not run in the development database but the test database
# the data is wipe out for each test

require 'test_helper'

class CategoryTest < ActiveSupport::TestCase 

    # run this method before each test runs
    def setup 
        @category = Category.new(name: "Sports") 
    end 
    test "category should be valid" do 
        assert @category.valid? 
    end 

    test "name should be present" do 
        @category.name = ""
        # test for false 
        assert_not @category.valid? 
    end 

    test "name should be unique" do 
        @category.save 
        @category_duplicate = Category.new(name: "Sports")
        assert_not @category_duplicate.valid?
    end 

    test "name should not be too long" do 
        @category.name = "a" * 26 # this gives 26 'a'
        assert_not @category.valid?
    end 

    test "name should not be too short" do 
        @category.name = "aa"
        assert_not @category.valid? 
    end 
end 