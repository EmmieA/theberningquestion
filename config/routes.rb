Rails.application.routes.draw do

  root 'welcome#index'

  resources   :questions
  resources   :blurbs
  resources   :friendships

  # post    'vote',             to: 'votes#create'
  # delete  'unvote',           to: 'votes#destroy'
  post    'vote',             to: 'questions#vote'
  delete  'unvote',           to: 'questions#unvote'
  get     'my_friends',       to: "users#my_friends"
  get     'search_friends',   to: "users#search"
  post    'add_friend',       to: "users#add_friend"
  get     'my_feed',          to: "users#my_feed"

  devise_for :users

end
