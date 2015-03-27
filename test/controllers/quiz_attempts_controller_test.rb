require 'test_helper'

class QuizAttemptsControllerTest < ActionController::TestCase
  setup do
    @quiz_attempt = quiz_attempts(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:quiz_attempts)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create quiz_attempt" do
    assert_difference('QuizAttempt.count') do
      post :create, quiz_attempt: { mark: @quiz_attempt.mark, quiz_id: @quiz_attempt.quiz_id, user_id: @quiz_attempt.user_id }
    end

    assert_redirected_to quiz_attempt_path(assigns(:quiz_attempt))
  end

  test "should show quiz_attempt" do
    get :show, id: @quiz_attempt
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @quiz_attempt
    assert_response :success
  end

  test "should update quiz_attempt" do
    patch :update, id: @quiz_attempt, quiz_attempt: { mark: @quiz_attempt.mark, quiz_id: @quiz_attempt.quiz_id, user_id: @quiz_attempt.user_id }
    assert_redirected_to quiz_attempt_path(assigns(:quiz_attempt))
  end

  test "should destroy quiz_attempt" do
    assert_difference('QuizAttempt.count', -1) do
      delete :destroy, id: @quiz_attempt
    end

    assert_redirected_to quiz_attempts_path
  end
end
