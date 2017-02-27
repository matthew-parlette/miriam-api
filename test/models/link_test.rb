require 'test_helper'

class LinkTest < ActiveSupport::TestCase
  test "link should not save without a url" do
    link = Link.new
    link.task = Task.first
    assert_not link.save, "Saved the link without a url"
  end

  test "should create a link with only a url" do
    link = Link.new
    link.task = Task.first
    link.url = "https://www.google.com"
    assert link.save!, "Could not save task with only a url"
  end
end
