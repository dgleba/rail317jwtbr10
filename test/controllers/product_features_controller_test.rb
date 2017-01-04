require 'test_helper'

class ProductFeaturesControllerTest < ActionController::TestCase
  setup do
    @product_feature = product_features(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:product_features)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create product_feature" do
    assert_difference('ProductFeature.count') do
      post :create, product_feature: { active_status: @product_feature.active_status, name: @product_feature.name, pfeature_id: @product_feature.pfeature_id, product_id: @product_feature.product_id, sort: @product_feature.sort }
    end

    assert_redirected_to product_feature_path(assigns(:product_feature))
  end

  test "should show product_feature" do
    get :show, id: @product_feature
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @product_feature
    assert_response :success
  end

  test "should update product_feature" do
    patch :update, id: @product_feature, product_feature: { active_status: @product_feature.active_status, name: @product_feature.name, pfeature_id: @product_feature.pfeature_id, product_id: @product_feature.product_id, sort: @product_feature.sort }
    assert_redirected_to product_feature_path(assigns(:product_feature))
  end

  test "should destroy product_feature" do
    assert_difference('ProductFeature.count', -1) do
      delete :destroy, id: @product_feature
    end

    assert_redirected_to product_features_path
  end
end
