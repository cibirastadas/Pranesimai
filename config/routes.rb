Rails.application.routes.draw do

  root 'posts#index', as: 'home'#Nurodau pagrindini puslapi
  
  get "about" => "pages#about"#Nurodau get metoda kuris yra nukreiptas i pages kontroleri about metoda(view)
  get "services" => "pages#services"
  resources :posts do #Kad nereiketu kurti rankiniu butu. Taip pat nurodauPereinu per visus comments route
    resources :comments
  end
end
