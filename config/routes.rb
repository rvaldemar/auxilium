Rails.application.routes.draw do
  devise_for :users


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
      get 'search/:query', to: 'questions#search', as: 'search'
      resources :questions, only: [:index, :show, :create, :update, :destroy] do
        resources :answers, only: [:create, :update, :destroy] do
          patch '/upvote', to: 'answers#upvote', as: 'upvote'
          patch '/downvote', to: 'answers#downvote', as: 'downvote'
          resources :comments, only: [:create, :update, :destroy]
        end
      end
    end
  end

  # get 'downvote', to: 'answers#downvote', as: 'downvote'

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
