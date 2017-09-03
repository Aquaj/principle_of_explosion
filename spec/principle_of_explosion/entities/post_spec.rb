require 'spec_helper'

describe Post do
  it 'has a title' do
    post = Post.new title: 'Law of Demeter'

    expect(post.title).to eq('Law of Demeter')
  end
end
