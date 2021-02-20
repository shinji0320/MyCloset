require 'rails_helper'

RSpec.describe 'ItemCommentモデルのテスト', type: :model do
  describe 'バリデーションのテスト' do
    subject { item_comment.valid? }

    let(:user) { create(:user) }
    let(:genre) { create(:genre) }
    let(:item) { create(:item, user_id: user.id, genre_id: genre.id) }
    let!(:item_comment) { build(:item_comment, user_id: user.id, item_id: item.id) }

    context 'commentカラム' do
      it '空欄でないこと' do
        item_comment.comment = ''
        is_expected.to eq false
      end
      it '2文字以上であること: 1文字は×' do
        item_comment.comment = Faker::Lorem.characters(number: 1)
        is_expected.to eq false
      end
      it '2文字以上であること: 2文字は〇' do
        item_comment.comment = Faker::Lorem.characters(number: 2)
        is_expected.to eq true
      end
      it '140文字以下であること: 140文字は〇' do
        item_comment.comment = Faker::Lorem.characters(number: 140)
        is_expected.to eq true
      end
      it '140文字以下であること: 1411文字は×' do
        item_comment.comment = Faker::Lorem.characters(number: 141)
        is_expected.to eq false
      end
    end
  end

  describe 'アソシエーションのテスト' do
    context 'Userモデルとの関係' do
      it 'N:1となっている' do
          expect(ItemComment.reflect_on_association(:user).macro).to eq :belongs_to
        end
      end
    context 'Itemモデルとの関係' do
      it 'N:1となっている' do
        expect(ItemComment.reflect_on_association(:item).macro).to eq :belongs_to
      end
    end
  end
end
