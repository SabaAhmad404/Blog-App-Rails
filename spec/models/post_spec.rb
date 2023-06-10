require 'rails_helper'

RSpec.describe Post, type: :model do
  user = User.create(Name: 'Peter', Photo: '123.jpg', Bio: 'Developer from US', PostsCounter: 0)
  subject do
    Post.new(Title: 'Intro to JS', Text: 'Full Stack Development', ComentsCounter: 0, LikesCounter: 0,
             author_id: user.id)
  end
  before { subject.save }
  context 'testing validations of post model' do
    it 'should have a title' do
      subject.Title = nil
      expect(subject).to_not be_valid
    end

    it 'should have title less than or equal to 250 characters' do
      name_length = subject.Title.length
      expect(name_length).to be <= 250
    end

    it 'should not have nil value for comments counter' do
      subject.ComentsCounter = nil
      expect(subject).to_not be_valid
    end

    it 'should have integer value greater or equal to 0 for comments counter' do
      subject.ComentsCounter = 0
      expect(subject).to be_valid
    end

    it 'should not have nil value for likes counter' do
      subject.LikesCounter = nil
      expect(subject).to_not be_valid
    end

    it 'should have integer value greater or equal to 0 for likes counter' do
      subject.LikesCounter = 0
      expect(subject).to be_valid
    end
  end

  context 'testing methods of post model' do
    it 'should return recent comments' do
      Comment.create(Text: 'Great Intro', user_id: user.id, post_id: subject.id)
      Comment.create(Text: 'It has everything', user_id: user.id, post_id: subject.id)
      Comment.create(Text: 'Do you have an academy?', user_id: user.id, post_id: subject.id)
      Comment.create(Text: "Who's your teacher", user_id: user.id, post_id: subject.id)
      Comment.create(Text: 'Would you like to give your facebook', user_id: user.id, post_id: subject.id)
      Comment.create(Text: 'Do you have these projects on github', user_id: user.id, post_id: subject.id)
      comments = subject.recent_comments
      expect(comments.length).to be 5
    end

  end
end