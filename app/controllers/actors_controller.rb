class ActorsController < ApplicationController
  def index
    @list_of_actors = Actor.all
    @list_of_movies = Movie.all
    render({ :template => "actor_templates/index.html.erb"})
  end

  def actor_individual_page
    @list_of_actor = Actor.all
    @actor_id = params.fetch("actor_id")
    
    render({ :template => "actor_templates/actor_individual_page.html.erb"})
  end
end