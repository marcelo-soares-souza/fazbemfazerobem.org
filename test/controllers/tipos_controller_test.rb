require 'test_helper'

class TiposControllerTest < ActionDispatch::IntegrationTest
  setup do
    @tipo = tipos(:one)
  end

  test "should get index" do
    get tipos_url
    assert_response :success
  end

  test "should get new" do
    get new_tipo_url
    assert_response :success
  end

  test "should create tipo" do
    assert_difference('Tipo.count') do
      post tipos_url, params: { tipo: { descricao: @tipo.descricao, nome: @tipo.nome, slug: @tipo.slug, user_id: @tipo.user_id } }
    end

    assert_redirected_to tipo_url(Tipo.last)
  end

  test "should show tipo" do
    get tipo_url(@tipo)
    assert_response :success
  end

  test "should get edit" do
    get edit_tipo_url(@tipo)
    assert_response :success
  end

  test "should update tipo" do
    patch tipo_url(@tipo), params: { tipo: { descricao: @tipo.descricao, nome: @tipo.nome, slug: @tipo.slug, user_id: @tipo.user_id } }
    assert_redirected_to tipo_url(@tipo)
  end

  test "should destroy tipo" do
    assert_difference('Tipo.count', -1) do
      delete tipo_url(@tipo)
    end

    assert_redirected_to tipos_url
  end
end
