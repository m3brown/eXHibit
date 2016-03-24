Given(/^I am on the search streams page$/) do
  visit(new_search_path)
end

When(/^I search for (.*)$/) do |search_text|
  fill_in('search_title', with: search_text)
  click_on('Go!')
end

Then(/^I will see the movie (.*) in results$/) do |movie_title|
  within('#results') do
    assert_text(movie_title)
  end
end
