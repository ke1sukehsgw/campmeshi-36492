require 'rails_helper'

RSpec.describe Tweet, type: :model do
  before do
    @tweet = FactoryBot.build(:tweet)
  end

  describe 'ツイートの保存' do
    context 'ツイートが投稿できる場合' do
      it 'title,imageが存在すれば投稿できる' do
        expect(@tweet).to be_valid
      end
      it 'bodyが空でも投稿できる' do
        @tweet.body = nil
        expect(@tweet).to be_valid
      end
    end
    context 'ツイートが投稿できない場合' do
      it 'titleが空では投稿できない' do
        @tweet.title = nil
        @tweet.valid?
        expect(@tweet.errors.full_messages).to include "Title can't be blank"
      end
      it 'imageが空では投稿できない' do
        @tweet.image = nil
        @tweet.valid?
        expect(@tweet.errors.full_messages).to include "Image can't be blank"
      end
      it 'ユーザーが紐付いていなければ投稿できない' do
        @tweet.user = nil
        @tweet.valid?
        expect(@tweet.errors.full_messages).to include('User must exist')
      end
    end
  end
end
