Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  recourses :users, only: [:show, :new, :create]
end
