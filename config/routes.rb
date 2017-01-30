Rails.application.routes.draw do
  

  get 'articles/upload' => "articles#upload"
  post "articles/upload" => "articles#execute_upload"
  get "articles/successful" => "articles#successful"
  delete "/articles" => "articles#delete_multiple"
  get "articles/deletearticles" => "articles#deletearticles"
  delete "articles/deletearticles" => "articles#delete_multiple"

  resources :articles do
  resources :comments
  end 



end
