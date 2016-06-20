Rails.application.routes.draw do
  root 'notes#index'
  resources :notes
end

# Helper  HTTP Verb   Path    Controller#Action
# Path / Url      
# Path Match
# notes_index_path    GET /notes/index(.:format)  notes#index
# root_path   GET /   notes#index
# notes_path  GET /notes(.:format)    notes#index
# POST    /notes(.:format)    notes#create
# new_note_path   GET /notes/new(.:format)    notes#new
# edit_note_path  GET /notes/:id/edit(.:format)   notes#edit
# note_path   GET /notes/:id(.:format)    notes#show
# PATCH   /notes/:id(.:format)    notes#update
# PUT /notes/:id(.:format)    notes#update
# DELETE  /notes/:id(.:format)    notes#destroy