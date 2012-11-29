require 'test_helper'

class PageTest < ActiveSupport::TestCase
  test "page is not saved if name is nil or empty" do
  	page = Page.new(page_id: 'lou')
  	assert !page.save, "Saved the page without a name"
  end
  test "page is not saved if page_id already present in DB" do
  	page = Page.new(page_id: pages(:one))
  	assert !page.save, "Saved the page even if already exists"
  end
end
