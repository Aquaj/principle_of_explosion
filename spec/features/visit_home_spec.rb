require 'features_helper'

describe 'visit home page' do
  scenario 'reading the blog\'s title' do
    visit '/'

    expect(page).to have_text('Principle of Explosion')
  end
end
