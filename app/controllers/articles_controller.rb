class ArticlesController < ApplicationController
	def new
	end

	def 
		@article = Article.new(params[:article])

		@article.save
		redirect_to @article
	end
end
