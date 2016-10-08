require 'test_helper'

class EntidadesControllerTest < ActionDispatch::IntegrationTest
  setup do
    @entidade = entidades(:one)
  end

  test "should get index" do
    get entidades_url
    assert_response :success
  end

  test "should get new" do
    get new_entidade_url
    assert_response :success
  end

  test "should create entidade" do
    assert_difference('Entidade.count') do
      post entidades_url, params: { entidade: { cnpj: @entidade.cnpj, descricao: @entidade.descricao, nome: @entidade.nome } }
    end

    assert_redirected_to entidade_url(Entidade.last)
  end

  test "should show entidade" do
    get entidade_url(@entidade)
    assert_response :success
  end

  test "should get edit" do
    get edit_entidade_url(@entidade)
    assert_response :success
  end

  test "should update entidade" do
    patch entidade_url(@entidade), params: { entidade: { cnpj: @entidade.cnpj, descricao: @entidade.descricao, nome: @entidade.nome } }
    assert_redirected_to entidade_url(@entidade)
  end

  test "should destroy entidade" do
    assert_difference('Entidade.count', -1) do
      delete entidade_url(@entidade)
    end

    assert_redirected_to entidades_url
  end
end
