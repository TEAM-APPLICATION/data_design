require 'test_helper'

class BankBudgetsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @bank_budget = bank_budgets(:one)
  end

  test "should get index" do
    get bank_budgets_url
    assert_response :success
  end

  test "should get new" do
    get new_bank_budget_url
    assert_response :success
  end

  test "should create bank_budget" do
    assert_difference('BankBudget.count') do
      post bank_budgets_url, params: { bank_budget: { all_funds: @bank_budget.all_funds, bank_budget: @bank_budget.bank_budget, fiscal_year: @bank_budget.fiscal_year, notes: @bank_budget.notes, unit: @bank_budget.unit, work_program: @bank_budget.work_program, work_program_group: @bank_budget.work_program_group } }
    end

    assert_redirected_to bank_budget_url(BankBudget.last)
  end

  test "should show bank_budget" do
    get bank_budget_url(@bank_budget)
    assert_response :success
  end

  test "should get edit" do
    get edit_bank_budget_url(@bank_budget)
    assert_response :success
  end

  test "should update bank_budget" do
    patch bank_budget_url(@bank_budget), params: { bank_budget: { all_funds: @bank_budget.all_funds, bank_budget: @bank_budget.bank_budget, fiscal_year: @bank_budget.fiscal_year, notes: @bank_budget.notes, unit: @bank_budget.unit, work_program: @bank_budget.work_program, work_program_group: @bank_budget.work_program_group } }
    assert_redirected_to bank_budget_url(@bank_budget)
  end

  test "should destroy bank_budget" do
    assert_difference('BankBudget.count', -1) do
      delete bank_budget_url(@bank_budget)
    end

    assert_redirected_to bank_budgets_url
  end
end
