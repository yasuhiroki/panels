require "application_system_test_case"

class RespondentsTest < ApplicationSystemTestCase
  setup do
    @respondent = respondents(:one)
  end

  test "visiting the index" do
    visit respondents_url
    assert_selector "h1", text: "Respondents"
  end

  test "should create respondent" do
    visit respondents_url
    click_on "New respondent"

    fill_in "Name", with: @respondent.name
    click_on "Create Respondent"

    assert_text "Respondent was successfully created"
    click_on "Back"
  end

  test "should update Respondent" do
    visit respondent_url(@respondent)
    click_on "Edit this respondent", match: :first

    fill_in "Name", with: @respondent.name
    click_on "Update Respondent"

    assert_text "Respondent was successfully updated"
    click_on "Back"
  end

  test "should destroy Respondent" do
    visit respondent_url(@respondent)
    click_on "Destroy this respondent", match: :first

    assert_text "Respondent was successfully destroyed"
  end
end
