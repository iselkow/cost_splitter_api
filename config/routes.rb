Rails.application.routes.draw do
  scope '/api' do
    scope '/v1' do
      resources :people, except: [:new, :edit]
    end
  end
end
