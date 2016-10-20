require 'test_helper'

class ApoiarsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @apoiar = apoiars(:one)
  end

  test "should get index" do
    get apoiars_url
    assert_response :success
  end

  test "should get new" do
    get new_apoiar_url
    assert_response :success
  end

  test "should create apoiar" do
    assert_difference('Apoiar.count') do
      post apoiars_url, params: { apoiar: { pedido_id: @apoiar.pedido_id, slug: @apoiar.slug, user_id: @apoiar.user_id } }
    end

    assert_redirected_to apoiar_url(Apoiar.last)
  end

  test "should show apoiar" do
    get apoiar_url(@apoiar)
    assert_response :success
  end

  test "should get edit" do
    get edit_apoiar_url(@apoiar)
    assert_response :success
  end

  test "should update apoiar" do
    patch apoiar_url(@apoiar), params: { apoiar: { pedido_id: @apoiar.pedido_id, slug: @apoiar.slug, user_id: @apoiar.user_id } }
    assert_redirected_to apoiar_url(@apoiar)
  end

  test "should destroy apoiar" do
    assert_difference('Apoiar.count', -1) do
      delete apoiar_url(@apoiar)
    end

    assert_redirected_to apoiars_url
  end
end
