require 'test_helper'

class PfeaturesControllerTest < ActionController::TestCase
  setup do
    @pfeature = pfeatures(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:pfeatures)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create pfeature" do
    assert_difference('Pfeature.count') do
      post :create, pfeature: { active_status: @pfeature.active_status, fdate: @pfeature.fdate, name: @pfeature.name, sort: @pfeature.sort }
    end

    assert_redirected_to pfeature_path(assigns(:pfeature))
  end

  test "should show pfeature" do
    get :show, id: @pfeature
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @pfeature
    assert_response :success
  end

  test "should update pfeature" do
    patch :update, id: @pfeature, pfeature: { active_status: @pfeature.active_status, fdate: @pfeature.fdate, name: @pfeature.name, sort: @pfeature.sort }
    assert_redirected_to pfeature_path(assigns(:pfeature))
  end

  test "should destroy pfeature" do
    assert_difference('Pfeature.count', -1) do
      delete :destroy, id: @pfeature
    end

    assert_redirected_to pfeatures_path
  end
end
