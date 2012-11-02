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

When /^I check all ratings$/ do
   @expected_ratings = @all_ratings

   step "I check expected ratings"
end

When /^I uncheck all ratings$/ do
   @expected_ratings = []

   # this will uncheck all ratings
   step "I check expected ratings"
end

When /I (un)?check the following ratings: (.*)/ do |uncheck, rating_list|
  # HINT: use String#split to split up the rating_list, then
  #   iterate over the ratings and reuse the "When I check..." or
  #   "When I uncheck..." steps in lines 89-95 of web_steps.rb
  @expected_ratings = Array.new
  rating_list.split(',').each do |rating|
       rating.strip!
       @expected_ratings << rating
  end

  step "I check expected ratings"
end

When /^I check expected ratings$/ do
  @all_ratings.each do |rating|
      if @expected_ratings.include?(rating) then
         step "I check \"ratings_#{rating}\""
      else
         step "I uncheck \"ratings_#{rating}\""
      end
  end 
end

# Make sure that one string (regexp) occurs before or after another one
#   on the same page

Then /I should see "(.*)" before "(.*)"/ do |e1, e2|
  #  ensure that that e1 occurs before e2.
  #  page.content  is the entire content of the page as a string.
  match = /#{e1}.*#{e2}/m =~ page.body

  assert match != nil, "'#{e1}' must be before '#{e2}' but it is not"
end

Then /^I should only see movies with these ratings$/ do
   # debugger
   @all_movies.each do |movie| 
      if @expected_ratings.include?(movie.rating) then
         step "I should see \"#{movie.title}\""
      else
         step "I should not see \"#{movie.title}\""
      end
   end
end

Then /^I should only see movies with ratings: (.*)/ do |rating_list|
  @expected_ratings = Array.new
  rating_list.split(',').each do |rating|
       rating.strip!
       @expected_ratings << rating
  end

  step "I should only see movies with these ratings"
end

Then /^I should see all of the movies$/ do
  step "I should only see movies with these ratings"  
end


