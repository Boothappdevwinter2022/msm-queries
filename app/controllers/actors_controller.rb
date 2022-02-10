class ActorsController < ApplicationController
  def index
    @list_of_actors = Actor.all
    @list_of_movies = Movie.all

    render({ :template => "actor_templates/index.html.erb" })
  end

  def actor_individual_page
    @list_of_actors = Actor.all
    @actor_id = params.fetch("actor_id")
    @current_actor = Actor.where({ :id => @actor_id })
    @list_of_movies = Character.all.where({ :actor_id => @actor_id })

    @this_year = Time.now.year
    @year_creation = @list_of_actors.where({ :id => @actor_id }).at(0).created_at.year
    @year_from_creation = @this_year - @year_creation
    @year_update = @list_of_actors.where({ :id => @actor_id }).at(0).updated_at.year
    @year_from_update = @this_year - @year_update

    render({ :template => "actor_templates/actor_individual_page.html.erb" })
  end
end
