require 'test_helper'

class ObstawieniesControllerTest < ActionController::TestCase
  setup do
    @obstawieny = obstawienies(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:obstawienies)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create obstawieny" do
    assert_difference('Obstawienie.count') do
      post :create, obstawieny: { opcja: @obstawieny.opcja, reputacja: @obstawieny.reputacja, user_id: @obstawieny.user_id, zaklad_id: @obstawieny.zaklad_id }
    end

    assert_redirected_to obstawieny_path(assigns(:obstawieny))
  end

  test "should show obstawieny" do
    get :show, id: @obstawieny
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @obstawieny
    assert_response :success
  end

  test "should update obstawieny" do
    put :update, id: @obstawieny, obstawieny: { opcja: @obstawieny.opcja, reputacja: @obstawieny.reputacja, user_id: @obstawieny.user_id, zaklad_id: @obstawieny.zaklad_id }
    assert_redirected_to obstawieny_path(assigns(:obstawieny))
  end

  test "should destroy obstawieny" do
    assert_difference('Obstawienie.count', -1) do
      delete :destroy, id: @obstawieny
    end

    assert_redirected_to obstawienies_path
  end
end
