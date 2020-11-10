class BankBudgetsController < ApplicationController
  before_action :set_bank_budget, only: [:show, :edit, :update, :destroy]

  # GET /bank_budgets
  # GET /bank_budgets.json
  def index
    @q = BankBudget.ransack(params[:q])
    @bank_budgets = @q.result.order(:fiscal_year).page(params[:page]).per(10)
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
