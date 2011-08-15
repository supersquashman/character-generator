require 'test_helper'

class DndCharactersControllerTest < ActionController::TestCase
  setup do
    @dnd_character = dnd_characters(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:dnd_characters)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create dnd_character" do
    assert_difference('DndCharacter.count') do
      post :create, :dnd_character => @dnd_character.attributes
    end

    assert_redirected_to dnd_character_path(assigns(:dnd_character))
  end

  test "should show dnd_character" do
    get :show, :id => @dnd_character.to_param
    assert_response :success
  end

  test "should get edit" do
    get :edit, :id => @dnd_character.to_param
    assert_response :success
  end

  test "should update dnd_character" do
    put :update, :id => @dnd_character.to_param, :dnd_character => @dnd_character.attributes
    assert_redirected_to dnd_character_path(assigns(:dnd_character))
  end

  test "should destroy dnd_character" do
    assert_difference('DndCharacter.count', -1) do
      delete :destroy, :id => @dnd_character.to_param
    end

    assert_redirected_to dnd_characters_path
  end
end
