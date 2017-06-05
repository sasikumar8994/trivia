require 'test_helper'

class SubmittedAnswersControllerTest < ActionDispatch::IntegrationTest
  setup do
    @submitted_answer = submitted_answers(:one)
  end

  test "should get index" do
    get submitted_answers_url
    assert_response :success
  end

  test "should get new" do
    get new_submitted_answer_url
    assert_response :success
  end

  test "should create submitted_answer" do
    assert_difference('SubmittedAnswer.count') do
      post submitted_answers_url, params: { submitted_answer: { answer: @submitted_answer.answer, question_id: @submitted_answer.question_id, score: @submitted_answer.score, user_id: @submitted_answer.user_id } }
    end

    assert_redirected_to submitted_answer_url(SubmittedAnswer.last)
  end

  test "should show submitted_answer" do
    get submitted_answer_url(@submitted_answer)
    assert_response :success
  end

  test "should get edit" do
    get edit_submitted_answer_url(@submitted_answer)
    assert_response :success
  end

  test "should update submitted_answer" do
    patch submitted_answer_url(@submitted_answer), params: { submitted_answer: { answer: @submitted_answer.answer, question_id: @submitted_answer.question_id, score: @submitted_answer.score, user_id: @submitted_answer.user_id } }
    assert_redirected_to submitted_answer_url(@submitted_answer)
  end

  test "should destroy submitted_answer" do
    assert_difference('SubmittedAnswer.count', -1) do
      delete submitted_answer_url(@submitted_answer)
    end

    assert_redirected_to submitted_answers_url
  end
end
