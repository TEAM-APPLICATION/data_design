class BankBudgetsController < ApplicationController
  before_action :set_bank_budget, only: [:show, :edit, :update, :destroy]

  # GET /bank_budgets
  # GET /bank_budgets.json
  def index
    @q = BankBudget.ransack(params[:q])
    @bank_budgets = @q.result.order(:fiscal_year).page(params[:page]).per(10)
  end

  def work_program_group
    @bank_budgets = BankBudget.pluck(:work_program_group).uniq
  end

  def work_show
    @bank_budgets = BankBudget.where(work_program_group: params[:work_program_group])
  end

  def trend
    @unit_arr2015 = []
    @final_arr2015 = []
    @budget2015 = []
    @funds2015 = []

    @unit_arr2016 = []
    @final_arr2016 = []
    @budget2016 = []
    @funds2016 = []

    @unit_arr2017 = []
    @final_arr2017 = []
    @budget2017 = []
    @funds2017 = []

    @unit_arr2018 = []
    @final_arr2018 = []
    @budget2018 = []
    @funds2018 = []

    @unit_arr2019 = []
    @final_arr2019 = []
    @budget2019 = []
    @funds2019 = []

    @unit_arr2020 = []
    @final_arr2020 = []
    @budget2020 = []
    @funds2020 = []

    @unit_arr2021 = []
    @final_arr2021 = []
    @budget2021 = []
    @funds2021 = []

    BankBudget.where(fiscal_year: "2015").each do |bank_budget|
      @unit_arr2015 << bank_budget.unit
      @budget2015 << bank_budget.bank_budget
      @funds2015 << bank_budget.all_funds
    end
    @final_arr2015 = [
      {
        name: 'Bank Budget (BB) (US$, Millions)',
        type: 'line',
        stack: '总量',
        areaStyle: {},
        data: @budget2015
      },
      {
        name: 'All Funds (US$, Millions)',
        type: 'line',
        stack: '总量',
        areaStyle: {},
        data: @funds2015
      }
    ].to_json

    BankBudget.where(fiscal_year: "2016").each do |bank_budget|
      @unit_arr2016 << bank_budget.unit
      @budget2016 << bank_budget.bank_budget
      @funds2016 << bank_budget.all_funds
    end
    @final_arr2016 = [
      {
        name: 'Bank Budget (BB) (US$, Millions)',
        type: 'line',
        stack: '总量',
        areaStyle: {},
        data: @budget2016
      },
      {
        name: 'All Funds (US$, Millions)',
        type: 'line',
        stack: '总量',
        areaStyle: {},
        data: @funds2016
      }
    ].to_json

    BankBudget.where(fiscal_year: "2017").each do |bank_budget|
      @unit_arr2017 << bank_budget.unit
      @budget2017 << bank_budget.bank_budget
      @funds2017 << bank_budget.all_funds
    end
    @final_arr2017 = [
      {
        name: 'Bank Budget (BB) (US$, Millions)',
        type: 'line',
        stack: '总量',
        areaStyle: {},
        data: @budget2017
      },
      {
        name: 'All Funds (US$, Millions)',
        type: 'line',
        stack: '总量',
        areaStyle: {},
        data: @funds2017
      }
    ].to_json

    BankBudget.where(fiscal_year: "2018").each do |bank_budget|
      @unit_arr2018 << bank_budget.unit
      @budget2018 << bank_budget.bank_budget
      @funds2018 << bank_budget.all_funds
    end
    @final_arr2018 = [
      {
        name: 'Bank Budget (BB) (US$, Millions)',
        type: 'line',
        stack: '总量',
        areaStyle: {},
        data: @budget2018
      },
      {
        name: 'All Funds (US$, Millions)',
        type: 'line',
        stack: '总量',
        areaStyle: {},
        data: @funds2018
      }
    ].to_json

    BankBudget.where(fiscal_year: "2019").each do |bank_budget|
      @unit_arr2019 << bank_budget.unit
      @budget2019 << bank_budget.bank_budget
      @funds2019 << bank_budget.all_funds
    end
    @final_arr2019 = [
      {
        name: 'Bank Budget (BB) (US$, Millions)',
        type: 'line',
        stack: '总量',
        areaStyle: {},
        data: @budget2019
      },
      {
        name: 'All Funds (US$, Millions)',
        type: 'line',
        stack: '总量',
        areaStyle: {},
        data: @funds2019
      }
    ].to_json

    BankBudget.where(fiscal_year: "2020").each do |bank_budget|
      @unit_arr2020 << bank_budget.unit
      @budget2020 << bank_budget.bank_budget
      @funds2020 << bank_budget.all_funds
    end
    @final_arr2020 = [
      {
        name: 'Bank Budget (BB) (US$, Millions)',
        type: 'line',
        stack: '总量',
        areaStyle: {},
        data: @budget2020
      },
      {
        name: 'All Funds (US$, Millions)',
        type: 'line',
        stack: '总量',
        areaStyle: {},
        data: @funds2020
      }
    ].to_json

    BankBudget.where(fiscal_year: "2021").each do |bank_budget|
      @unit_arr2021 << bank_budget.unit
      @budget2021 << bank_budget.bank_budget
      @funds2021 << bank_budget.all_funds
    end
    @final_arr2021 = [
      {
        name: 'Bank Budget (BB) (US$, Millions)',
        type: 'line',
        stack: '总量',
        areaStyle: {},
        data: @budget2021
      },
      {
        name: 'All Funds (US$, Millions)',
        type: 'line',
        stack: '总量',
        areaStyle: {},
        data: @funds2021
      }
    ].to_json
  end

  # GET /bank_budgets/1
  # GET /bank_budgets/1.json
  def show
  end

  # GET /bank_budgets/new
  def new
    @bank_budget = BankBudget.new
  end

  # GET /bank_budgets/1/edit
  def edit
  end

  # POST /bank_budgets
  # POST /bank_budgets.json
  def create
    @bank_budget = BankBudget.new(bank_budget_params)

    respond_to do |format|
      if @bank_budget.save
        format.html { redirect_to @bank_budget, notice: 'Bank budget was successfully created.' }
        format.json { render :show, status: :created, location: @bank_budget }
      else
        format.html { render :new }
        format.json { render json: @bank_budget.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /bank_budgets/1
  # PATCH/PUT /bank_budgets/1.json
  def update
    respond_to do |format|
      if @bank_budget.update(bank_budget_params)
        format.html { redirect_to @bank_budget, notice: 'Bank budget was successfully updated.' }
        format.json { render :show, status: :ok, location: @bank_budget }
      else
        format.html { render :edit }
        format.json { render json: @bank_budget.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /bank_budgets/1
  # DELETE /bank_budgets/1.json
  def destroy
    @bank_budget.destroy
    respond_to do |format|
      format.html { redirect_to bank_budgets_url, notice: 'Bank budget was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_bank_budget
      @bank_budget = BankBudget.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def bank_budget_params
      params.require(:bank_budget).permit(:work_program_group, :work_program, :unit, :fiscal_year, :bank_budget, :all_funds, :notes)
    end
end
