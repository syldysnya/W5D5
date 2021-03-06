def what_was_that_one_with(those_actors)
  # Find the movies starring all `those_actors` (an array of actor names).
  # Show each movie's title and id.
  Movie.joins(:actors)
       .where("actors.name IN (?)", those_actors[0])
       .select(:title, :id)
  
end

def golden_age
  # Find the decade with the highest average movie score.
  decade_averages = Hash.new {|h,k| h[k] = []}
  movies_by_decade = Movie.all.map do |movie| 
    decade = movie.yr / 10 * 10
    decade_averages[decade] << movie.score
  end
  max_average = 0
  max_decade = nil
  decade_averages.each do |k,v|
    test_average = v.sum / (v.length*1.0)
    if max_average < test_average
        max_decade = k 
    end
  end
  max_decade
end

def costars(name)
  # List the names of the actors that the named actor has ever
  # appeared with.
  # Hint: use a subquery
  movies = Movie.joins(:actors)
       .where("actors.name = ?", name)
       .pluck(:title)

  Movie.joins(:actors)
       .where("title IN (?)", movies)
       .group("actors.id")
       .where("actors.name != ?", name)
       .pluck("actors.name")
end

def actor_out_of_work
  # Find the number of actors in the database who have not appeared in a movie

end

def starring(whazzername)
  # Find the movies with an actor who had a name like `whazzername`.
  # A name is like whazzername if the actor's name contains all of the
  # letters in whazzername, ignoring case, in order.

  # ex. "Sylvester Stallone" is like "sylvester" and "lester stone" but
  # not like "stallone sylvester" or "zylvester ztallone"

end

def longest_career
  # Find the 3 actors who had the longest careers
  # (the greatest time between first and last movie).
  # Order by actor names. Show each actor's id, name, and the length of
  # their career.

end
