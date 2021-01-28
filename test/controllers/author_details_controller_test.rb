require 'test_helper'

class AuthorDetailsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @author_detail = author_details(:one)
  end

  test "should get index" do
    get author_details_url
    assert_response :success
  end

  test "should get new" do
    get new_author_detail_url
    assert_response :success
  end

  test "should create author_detail" do
    assert_difference('AuthorDetail.count') do
      post author_details_url, params: { author_detail: { age: @author_detail.age, city: @author_detail.city, mobileno: @author_detail.mobileno } }
    end

    assert_redirected_to author_detail_url(AuthorDetail.last)
  end

  test "should show author_detail" do
    get author_detail_url(@author_detail)
    assert_response :success
  end

  test "should get edit" do
    get edit_author_detail_url(@author_detail)
    assert_response :success
  end

  test "should update author_detail" do
    patch author_detail_url(@author_detail), params: { author_detail: { age: @author_detail.age, city: @author_detail.city, mobileno: @author_detail.mobileno } }
    assert_redirected_to author_detail_url(@author_detail)
  end

  test "should destroy author_detail" do
    assert_difference('AuthorDetail.count', -1) do
      delete author_detail_url(@author_detail)
    end

    assert_redirected_to author_details_url
  end
end
