require 'test_helper'

class ZakladsControllerTest < ActionController::TestCase
  setup do
    @zaklad = zaklads(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:zaklads)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create zaklad" do
    assert_difference('Zaklad.count') do
      post :create, zaklad: { data: @zaklad.data, gosc: @zaklad.gosc, gospodarz: @zaklad.gospodarz, k1: @zaklad.k1, k2: @zaklad.k2, k3: @zaklad.k3 }
    end

    assert_redirected_to zaklad_path(assigns(:zaklad))
  end

  test "should show zaklad" do
    get :show, id: @zaklad
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @zaklad
    assert_response :success
  end

  test "should update zaklad" do
    put :update, id: @zaklad, zaklad: { data: @zaklad.data, gosc: @zaklad.gosc, gospodarz: @zaklad.gospodarz, k1: @zaklad.k1, k2: @zaklad.k2, k3: @zaklad.k3 }
    assert_redirected_to zaklad_path(assigns(:zaklad))
  end

  test "should destroy zaklad" do
    assert_difference('Zaklad.count', -1) do
      delete :destroy, id: @zaklad
    end

    assert_redirected_to zaklads_path
  end
end
