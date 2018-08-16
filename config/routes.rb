Rails.application.routes.draw do
  devise_for :users
  root to: 'pages#home'

  get 'search', to: 'question#search_results', as: 'search_result'

  # delete 'questions/:id', to: 'questions#fb_destroy'
  # delete 'questions/:question_id/answers/:id', to: 'answers#fb_destroy'
  # delete 'questions/:question_id/answers/:answer_id/comments/:id', to: 'comments#fb_destroy'

  # resources :questions, only: [:create, :show, :update] do # show
  #   resources :answers, only: [:create, :update] do
  #     resources :comments, only: [:create, :update]

  #   end
  # end

  namespace :api, defaults: { format: :json } do
    namespace :v1 do
      resources :questions, only: [ :index ]
    end
  end


  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
