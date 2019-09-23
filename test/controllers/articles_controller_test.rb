require 'test_helper'

class ArticlesControllerTest < ActionDispatch::IntegrationTest
  test "should get article index" do
    get articles_url
    assert_response :success
  end
  test "should get article show" do
    article = Article.create!(
      description: "Test Description",
      title: "Test Title",
      author: "Test Author",
      status: "draft",
      body: "Test Body"
    )
    get article_url(article)
    assert_response :success
  end
end
