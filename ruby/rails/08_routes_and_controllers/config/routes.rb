Rails.application.routes.draw do

  get 'say/hello'
  get 'say/hello/:id' => 'hello#name'
  get 'hello/index'
  get 'times/index'
  get 'times/restart'

  root 'say#index'

    resources :hello
    resources :say
    resources :times
end

# ​ When a http GET request to 'http://localhost:3000/hello' is sent, have it display a simple text that says 'Hello CodingDojo!'
#  When a http GET request to 'http://localhost:3000/say/hello' is sent, have it display a simple text that says 'Saying Hello!'
#  When a http GET request to 'http;//localhost:3000/say/hello/joe' is sent, have it display a simple text that says 'Saying Hello Joe!'
#  When a http GET request to 'http;//localhost:3000/say/hello/michael' is sent, have it redirect to a url of 'say/hello/joe'.
#  When a http GET request to 'http://localhost:3000' is sent, have the 'say' controller's index method handle the response; have it render a text that says 'What do you want me to say???'
#  When a http GET request to 'http://localhost:3000/times' is sent, have it tell you how many times you've visited that page. When you first visit that url, it should say 'You visited this url 1 time'. Keep reloading the page to make sure the number goes up.
#  When a http GET request to 'http://localhost:3000/times/restart' is sent, have it reset the session and display a text that says 'Destroyed the session!'.