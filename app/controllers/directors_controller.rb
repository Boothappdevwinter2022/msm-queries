class DirectorsController < ApplicationController
  def index
    @list_of_directors = Director.all
    render({ :template => "director_templates/index.html.erb"})
  end

  def director_individual_page
    @list_of_directors = Director.all
    @director_id = params.fetch("director_id")
    @list_of_movies = Movie.all.where({ :director_id => @director_id})
    @this_year = Time.now.year
    @year_creation = @list_of_directors.where({:id => @director_id}).at(0).created_at.year
    @year_from_creation = @this_year - @year_creation
    @year_update = @list_of_directors.where({:id => @director_id}).at(0).updated_at.year
    @year_from_update = @this_year - @year_update
    
    render({ :template => "director_templates/director_individual_page.html.erb"})
  end
end