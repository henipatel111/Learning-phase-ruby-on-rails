Rails.application.routes.draw do
  
  get 'articles/upload' => "articles#upload"
  post "articles/upload" => "articles#execute_upload"
  get "articles/successful" => "articles#successful"

  resources :articles do
  resources :comments
  end 

end
