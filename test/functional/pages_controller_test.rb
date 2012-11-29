require 'test_helper'

class PagesControllerTest < ActionController::TestCase
  setup do
    @page = pages(:three)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:pages)
  end

  test "should create page" do
    assert_difference('Page.count') do
      post :create, page: {page_id: 'roger'}
    end
    assert_redirected_to pages_path
  end

  test "should not create page because facebook page is not valid" do
    assert_difference('Page.count', +0) do
      post :create, page: {page_id: 'khqskjdhkjqshdkjqdhkjsdhq'}
    end
    assert_response :success
  end

  test "should show page" do
    get :show, id: @page
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @page
    assert_response :success
  end

  test "should update page" do
    put :update, id: @page, page: { page_id: @page.page_id }
    assert_redirected_to pages_path
  end

  test "should destroy page" do
    assert_difference('Page.count', -1) do
      delete :destroy, id: @page
    end

    assert_redirected_to pages_path
  end
end
