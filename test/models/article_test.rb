require 'test_helper'

class ArticleTest < ActiveSupport::TestCase
  test "an article can be created if it has all the required fields" do
    article = Article.create!(
      description: "Test Description",
      title: "Test Title",
      author: "Test Author",
      status: "draft",
      body: "Test Body"
    )
    assert article.present?, 'User was not an admin when it should be'
  end
  test "an article is not created if it does not have required fields" do
    assert_raises(Exception) {
      Article.create!(
        description: "Test Description",
        author: "Test Author",
        status: "draft",
        body: "Test Body"
      )
    }
    assert_raises(Exception) {
      Article.create!(
        title: "Test Title",
        author: "Test Author",
        status: "draft",
        body: "Test Body"
      )
    }
    assert_raises(Exception) {
      Article.create!(
        title: "Test Title",
        description: "Test Description",
        status: "draft",
        body: "Test Body"
      )
    }
    assert_raises(Exception) {
      Article.create!(
        title: "Test Title",
        description: "Test Description",
        author: "Test Author",
        body: "Test Body"
      )
    }
    assert_raises(Exception) {
      Article.create!(
        title: "Test Title",
        description: "Test Description",
        author: "Test Author",
        status: "draft"
      )
    }
  end
end
