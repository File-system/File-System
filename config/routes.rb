Rails.application.routes.draw do
  root 'logins#login'
  resources :documents
  resources :events
  get '/forgot' => 'logins#forget'
  get '/dashboard' => 'logins#dashboard'
  get '/create_account' => 'account#create_account'
  get '/log_user' => 'logins#login'
  get '/log' => 'logins#log_user'
  get 'forgot' => 'logins#forget'
  get '/dashboard' => 'logins#dashboard'
  get '/view_documents' => 'documents#view_documents'
  get '/view_event' => 'events#view_event'
  get '/add_document' => 'documents#add_document'
  get '/add_event' => 'events#add_event'
  get '/folders' => 'documents#folders'
  get '/profile_information' => 'account#profile_information'
  get '/submit_event' => 'events#submit_event'
  get '/add_event_path' => 'events#add_event'
  post '/add_event' => 'events#add_event'
  post '/add_documents' => 'documents#add_documents'
  post '/view_documents' => 'documents#view_documents'
  post '/redirect_acct' => 'account#redirect_account'
  get '/edit_document_view' => 'documents#edit_document_view'
  post '/edit_document_view' => 'documents#edit_document_view'
  get '/update_document' => 'documents#update_document'
  post '/update_document' => 'documents#update_document'
  get '/delete_document' => 'documents#delete_document'
  get '/attachments' => 'attachments#view_file'
  post '/attachments' => 'attachments#save_file'
  get '/update_event' => 'events#update_event'
  post '/update_event' => 'events#update_event'
  get '/view_file' => 'attachments#view_file'
  get '/upload_file' => 'attachments#upload_file'
  get '/save_file' => 'attachments#save_file'
  get '/delete_file' => 'attachments#delete_file'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
