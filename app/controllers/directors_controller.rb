class DirectorsController < ApplicationController
  def index
    @list_of_directors = Director.all
    render({ :template => "director_templates/index.html.erb"})
  end

  def director_individual_page
    @list_of_directors = Director.all
    @director_id = params.fetch("director_id")
    @list_of_movies = Movie.all.where({ :director_id => @director_id})
    render({ :template => "director_templates/director_individual_page.html.erb"})
  end
end