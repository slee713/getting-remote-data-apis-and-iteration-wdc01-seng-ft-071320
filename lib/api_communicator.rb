require 'rest-client'
require 'json'
require 'pry'

def json_parse(url)
  response_string = RestClient.get(url)
  JSON.parse(response_string)
end

def get_character(character_name)
  response_hash = json_parse('http://swapi.dev/api/people')
  response_hash["results"].find {|characters| characters["name"].downcase == character_name.downcase}
end

def get_character_movies_from_api(character_name)
  #make the web request
  films = []
  get_character(character_name)["films"].each do |film|
    response_hash = json_parse(film)
    films << response_hash
  end
  films
  # iterate over the response hash to find the collection of `films` for the given
  #   `character`
  # collect those film API urls, make a web request to each URL to get the info
  #  for that film
  # return value of this method should be collection of info about each film.
  #  i.e. an array of hashes in which each hash reps a given film
  # this collection will be the argument given to `print_movies`
  #  and that method will do some nice presentation stuff like puts out a list
  #  of movies by title. Have a play around with the puts with other info about a given film.
end

def print_movies(films)
  # some iteration magic and puts out the movies in a nice list
  films.each_with_index do |film, index|
    puts "#{index + 1}. #{film["title"]}"
  end
end

def show_character_movies(character)
  films = get_character_movies_from_api(character)
  print_movies(films)
end

## BONUS

# that `get_character_movies_from_api` method is probably pretty long. Does it do more than one job?
# can you split it up into helper methods?
