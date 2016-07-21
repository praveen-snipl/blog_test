require 'test_helper'

class ArticleTest < ActiveSupport::TestCase

  test "some error method" do
  	 	assert_raises(NameError) do
    		some_undefined_variable
  		end
  		assert true
  end

  test "save article without title" do
  	article = ::Article.create({title: "", message: "ruby is interpreted language"})
  	puts article.to_json
    assert_not article.save, "saved the article without title"
  end

end
