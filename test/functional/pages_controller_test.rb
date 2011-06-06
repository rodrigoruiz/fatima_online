require 'test_helper'

class PagesControllerTest < ActionController::TestCase
  test "should get home" do
    get :home
    assert_response :success
  end

  test "should get procedimentos" do
    get :procedimentos
    assert_response :success
  end

  test "should get consultorios" do
    get :consultorios
    assert_response :success
  end

  test "should get dra_fatima" do
    get :dra_fatima
    assert_response :success
  end

  test "should get contato" do
    get :contato
    assert_response :success
  end

end
