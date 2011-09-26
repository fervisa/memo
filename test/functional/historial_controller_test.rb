require 'test_helper'

class HistorialControllerTest < ActionController::TestCase
  test "should get listar" do
    get :listar
    assert_response :success
  end

  test "should get detalle" do
    get :detalle
    assert_response :success
  end

  test "should get guardar" do
    get :guardar
    assert_response :success
  end

end
