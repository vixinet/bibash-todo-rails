require 'test_helper'

class StaticPagesControllerTest < ActionDispatch::IntegrationTest
  test "should get home" do
    get '/'
    assert_response :success
  end

  test "should get privacy" do
    get '/privacy'
    assert_response :success
  end

  test "should get legal" do
    get '/legal'
    assert_response :success
  end

  test "should get legal-terms" do
    get '/legal-terms'
    assert_response :success
  end

  test "should get location" do
    get '/location'
    assert_response :success
  end

end
