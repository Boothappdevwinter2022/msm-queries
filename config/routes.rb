Rails.application.routes.draw do
  get("/", { :controller => "application", :action => "homepage" })
  get("/directors", { :controller => "directors", :action => "index" })
  get("/directors/youngest", { :controller => "directors", :action => "youngest_director"})
  get("/directors/eldest", { :controller => "directors", :action => "eldest_director"})
  get("/directors/:director_id", { :controller => "directors", :action => "director_individual_page"})

  get("/movies", { :controller => "movies", :action => "index" })
  get("/movies/:movie_id", { :controller => "movies", :action => "movie_individual_page"})

  get("/actors", { :controller => "actors", :action => "index" })
  get("/actors/:actor_id", { :controller => "actors", :action => "actor_individual_page"})  
end
