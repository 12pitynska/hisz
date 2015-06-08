require 'test_helper'

class TheoriesControllerTest < ActionController::TestCase
  setup do
    @theory = theories(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:theories)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create theory" do
    assert_difference('Theory.count') do
      post :create, theory: { body: @theory.body, title: @theory.title }
    end

    assert_redirected_to theory_path(assigns(:theory))
  end

  test "should show theory" do
    get :show, id: @theory
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @theory
    assert_response :success
  end

  test "should update theory" do
    patch :update, id: @theory, theory: { body: @theory.body, title: @theory.title }
    assert_redirected_to theory_path(assigns(:theory))
  end

  test "should destroy theory" do
    assert_difference('Theory.count', -1) do
      delete :destroy, id: @theory
    end

    assert_redirected_to theories_path
  end
end
