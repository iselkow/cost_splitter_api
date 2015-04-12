Rails.application.routes.draw do
  resources :person_expense_records, except: [:new, :edit]
  resources :expenses, except: [:new, :edit]
  scope '/api' do
    scope '/v1' do
      resources :people, except: [:new, :edit]
    end
  end
end
