require 'test_helper'

class ArticlesHelperTest < ActionView::TestCase
  test "should return the full article" do
    @article = articles(:one)
 
    assert_dom_equal %{<a href="/article/#{@article.id}">MyString MyText</a>}, link_to_article(@article)
  end
end