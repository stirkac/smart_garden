require 'test_helper'

class StatusesControllerTest < ActionController::TestCase
  setup do
    @status = statuses(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:statuses)
  end

  test "should create status" do
    assert_difference('Status.count') do
      post :create, status: { humidity: @status.humidity, temperature: @status.temperature }
    end

    assert_response 201
  end

  test "should show status" do
    get :show, id: @status
    assert_response :success
  end

  test "should update status" do
    put :update, id: @status, status: { humidity: @status.humidity, temperature: @status.temperature }
    assert_response 204
  end

  test "should destroy status" do
    assert_difference('Status.count', -1) do
      delete :destroy, id: @status
    end

    assert_response 204
  end
end
