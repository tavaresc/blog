require 'test_helper'

class ArticlesControllerTest < ActionDispatch::IntegrationTest
	setup do
		@headers_custom = { 'Authorization' => ActionController::HttpAuthentication::Basic.encode_credentials('dhh', 'secret') }

		@article = articles(:one)
	end

	test "should get index" do

		get articles_url, headers: @headers_custom
		assert_response :success
	end

	test "should get new" do
		get new_article_url
		assert_response :success
	end

	test "should create article" do
		assert_difference('Article.count') do
			post articles_url, params: { article: { text: @article.text, title: @article.title } }
		end

		assert_redirected_to article_url(Article.last)
		assert_equal 'Article was successfully created.', flash[:notice]
	end

	test "should show article" do
		get article_url(@article)
		assert_response :success
	end

	test "should get edit" do
		get edit_article_url(@article)
		assert_response :success
	end

	test "should update article" do
		patch article_url(@article), params: { article: { title: "updated" } }, headers: @headers_custom
		assert_redirected_to article_url(@article)
		# Reload association to fetch updated data and assert that title is updated.
		@article.reload
		assert_equal "updated", @article.title
	end

	test "should destroy article" do
		assert_difference('Article.count', -1) do
			delete article_url(@article)
		end

		assert_redirected_to articles_url
	end
end
