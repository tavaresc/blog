require "application_system_test_case"

class ArticlesTest < ApplicationSystemTestCase
  test "viewing the index" do
    visit articles_path

    assert_selector "h1", text: "Articles"
  end

  test "creating an article" do
  	visit articles_path

  	click_on "New article"

  	fill_in "Title", with: "Creating an article"
  	fill_in "Text", with: "Created this article succesfully!"

  	take_screenshot
  	click_on "Create Article"

  	assert_text "Creating an article"
  end
end
