Rails.application.routes.draw do
  resources :tarot_answers
  resources :tarot_bots
  resources :saju_answers
  resources :saju_bots
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  get "init_saju_bots" => "saju_bots#init"
  get "init_tarot_bots" => "tarot_bots#init"
end
