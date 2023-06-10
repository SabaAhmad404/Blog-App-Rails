require 'rails_helper'

RSpec.describe Like, type: :model do
  user = User.create(Name: 'Peter', Photo: '123.jpg', Bio: 'Developer from US', PostsCounter: 0)
  post = Post.create(Title: 'Intro to JS', Text: 'Full Stack Development', ComentsCounter: 0, LikesCounter: 0,
                     author_id: user.id)
  subject { Like.new(user_id: user.id, post_id: post.id) }
  before { subject.save }
  context 'testing methods of model of like' do
    it 'should increment the likes counter in respective post' do
      post_likes = subject.post.LikesCounter
      expect(post_likes).to be 1
    end
  end
end
