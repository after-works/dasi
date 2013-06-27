require 'test_helper'

class SongtagsControllerTest < ActionController::TestCase
  setup do
    @songtag = songtags(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:songtags)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create songtag" do
    assert_difference('Songtag.count') do
      post :create, songtag: { contents: @songtag.contents, original_song_id: @songtag.original_song_id, title: @songtag.title }
    end

    assert_redirected_to songtag_path(assigns(:songtag))
  end

  test "should show songtag" do
    get :show, id: @songtag
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @songtag
    assert_response :success
  end

  test "should update songtag" do
    put :update, id: @songtag, songtag: { contents: @songtag.contents, original_song_id: @songtag.original_song_id, title: @songtag.title }
    assert_redirected_to songtag_path(assigns(:songtag))
  end

  test "should destroy songtag" do
    assert_difference('Songtag.count', -1) do
      delete :destroy, id: @songtag
    end

    assert_redirected_to songtags_path
  end
end
