class MoviesController < ApplicationController
  def index
    @list_of_movies = Movie.all
    @list_of_directors = Director.all
    render({ :template => "movie_templates/index.html.erb"})
  end

  def movie_individual_page
    @movie_id = params.fetch("movie_id")
    @current_movie = Movie.where( { :id => @movie_id})
    @director_id = @current_movie.at(0).director_id
    @director_name = Director.where({ :id => @director_id}).at(0).name

    @this_year = Time.now.year
    @year_creation = @current_movie.at(0).created_at.year
    @year_from_creation = @this_year - @year_creation
    @year_update = @current_movie.at(0).updated_at.year
    @year_from_update = @this_year - @year_update

    render({ :template => "movie_templates/movie_individual_page.html.erb"})
  end
end