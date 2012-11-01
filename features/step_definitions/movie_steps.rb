Given /^the following movies exist:$/ do |movies_table|
  @all_movies = Array.new
  movies_table.hashes.each do |movie|
    @new_movie = Movie.create(:title => movie[:title], :rating => movie[:rating], :release_date => movie[:release_date], :director => movie[:director])
    @all_movies << @new_movie
  end

  @all_ratings = @all_movies.collect { |movie| movie.rating }.uniq
end

Then /^the director of "([^"]*)" should be "([^"]*)"$/ do |movie, director|
   step "I should see \"#{director}\""
end

