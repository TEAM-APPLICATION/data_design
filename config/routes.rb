Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root to: "bank_budgets#index"
  resources :bank_budgets do
    collection do
      get :work_program_group
      get :work_show
      get :trend
    end
  end
end
