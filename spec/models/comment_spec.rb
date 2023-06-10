require 'rails_helper'

RSpec.describe Comment, type: :model do
  user = User.create(Name: 'Peter', Photo: '123.jpg', Bio: 'Developer from US', PostsCounter: 0)
  post = Post.create(Title: 'Intro to JS', Text: 'Full Stack Development', ComentsCounter: 0, LikesCounter: 0,
                     author_id: user.id)
  subject { Comment.new(Text: 'Good tutorial', user_id: user.id, post_id: post.id) }
  before { subject.save }
  context 'testing methods of model of comment' do
    it 'should increment the comments counter in respective post' do
      post_comments = subject.post.ComentsCounter
      expect(post_comments).to be 1
    end
  end
end
