require 'rails_helper'

RSpec.describe User, type: :model do
  subject { User.new(Name: 'Peter', Photo: '123.jpg', Bio: 'Developer from US', PostsCounter: 0) }
  before { subject.save }
  context 'testing validations of user model' do
    it 'should have a username' do
      subject.Name = nil
      expect(subject).to_not be_valid
    end

    it 'should have username less than or equal to 250 characters' do
      name_length = subject.Name.length
      expect(name_length).to be <= 250
    end
  end

  context 'testing methods of user model' do
    it 'should return recent users' do
      Post.create(Title: 'Intro to JS', Text: 'Full Stack Development', ComentsCounter: 0, LikesCounter: 0,
                  author_id: subject.id)
      user_posts = subject.recent_posts
      expect(user_posts.length).to be 3
    end
  end
end
