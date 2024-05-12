require "application_system_test_case"

class QuestionAnswersTest < ApplicationSystemTestCase
  setup do
    @question_answer = question_answers(:one)
  end

  test "visiting the index" do
    visit question_answers_url
    assert_selector "h1", text: "Question answers"
  end

  test "should create question answer" do
    visit question_answers_url
    click_on "New question answer"

    fill_in "Answer id", with: @question_answer.answer_id
    fill_in "Question id", with: @question_answer.question_id
    click_on "Create Question answer"

    assert_text "Question answer was successfully created"
    click_on "Back"
  end

  test "should update Question answer" do
    visit question_answer_url(@question_answer)
    click_on "Edit this question answer", match: :first

    fill_in "Answer id", with: @question_answer.answer_id
    fill_in "Question id", with: @question_answer.question_id
    click_on "Update Question answer"

    assert_text "Question answer was successfully updated"
    click_on "Back"
  end

  test "should destroy Question answer" do
    visit question_answer_url(@question_answer)
    click_on "Destroy this question answer", match: :first

    assert_text "Question answer was successfully destroyed"
  end
end
