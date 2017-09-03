require_relative '../../../../apps/web/views/posts/index'

describe Web::Views::Posts::Index do
  let(:exposures) { Hash[posts: []] }
  let(:template)  { Hanami::View::Template.new('apps/web/templates/posts/index.html.haml') }
  let(:view)      { described_class.new(template, exposures) }
  let(:rendered)  { view.render }

  it 'exposes #posts' do
    expect(view.posts).to eq(exposures.fetch(:posts))
  end

  context 'with posts' do
    let(:post1) { Post.new(title: 'The Law of Demeter', body: 'Lorem ipsum') }
    let(:post2) { Post.new(title: 'How do y\'all keep blogs', body: 'Lorem ipsum') }

    let(:exposures) { Hash[posts: [post1, post2]] }

    it 'renders a list of posts' do
      expect(rendered).to include('The Law of Demeter')
      expect(rendered).to include('How do y\'all keep blogs')
    end

    it 'does not include a placeholder' do
      expect(rendered).to_not include('No posts yet!')
    end
  end

  context 'without posts' do
    it 'renders a placeholder' do
      expect(rendered).to include('No posts yet!')
    end
  end
end
