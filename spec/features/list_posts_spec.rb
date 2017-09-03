require 'features_helper'

describe 'list books' do
  let(:repository) { PostRepository.new }

  before do
    repository.clear

    repository.create(title: 'The Law of Demeter', body: 'Lorem ipsum')
    repository.create(title: 'Test', body: 'Lorem ipsum')
  end

  scenario 'displays a list of posts' do
    visit '/posts'

    expect(page).to have_css('.post', count: 2)
  end
end
