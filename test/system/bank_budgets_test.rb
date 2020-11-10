require "application_system_test_case"

class BankBudgetsTest < ApplicationSystemTestCase
  setup do
    @bank_budget = bank_budgets(:one)
  end

  test "visiting the index" do
    visit bank_budgets_url
    assert_selector "h1", text: "Bank Budgets"
  end

  test "creating a Bank budget" do
    visit bank_budgets_url
    click_on "New Bank Budget"

    fill_in "All funds", with: @bank_budget.all_funds
    fill_in "Bank budget", with: @bank_budget.bank_budget
    fill_in "Fiscal year", with: @bank_budget.fiscal_year
    fill_in "Notes", with: @bank_budget.notes
    fill_in "Unit", with: @bank_budget.unit
    fill_in "Work program", with: @bank_budget.work_program
    fill_in "Work program group", with: @bank_budget.work_program_group
    click_on "Create Bank budget"

    assert_text "Bank budget was successfully created"
    click_on "Back"
  end

  test "updating a Bank budget" do
    visit bank_budgets_url
    click_on "Edit", match: :first

    fill_in "All funds", with: @bank_budget.all_funds
    fill_in "Bank budget", with: @bank_budget.bank_budget
    fill_in "Fiscal year", with: @bank_budget.fiscal_year
    fill_in "Notes", with: @bank_budget.notes
    fill_in "Unit", with: @bank_budget.unit
    fill_in "Work program", with: @bank_budget.work_program
    fill_in "Work program group", with: @bank_budget.work_program_group
    click_on "Update Bank budget"

    assert_text "Bank budget was successfully updated"
    click_on "Back"
  end

  test "destroying a Bank budget" do
    visit bank_budgets_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Bank budget was successfully destroyed"
  end
end
