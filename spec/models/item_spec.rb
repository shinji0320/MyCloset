require 'rails_helper'

RSpec.describe 'Itemモデルのテスト', type: :model do
  describe 'バリデーションのテスト' do
    subject { item.valid? }

    let(:user) { create(:user) }
    let(:genre) { create(:genre) }
    let!(:item) { build(:item, user_id: user.id, genre_id: genre.id) }

    context 'nameカラム' do
      it '空欄でないこと' do
        item.name = ''
        is_expected.to eq false
      end
      it '2文字以上であること: 2文字は〇' do
        item.name = Faker::Lorem.characters(number: 2)
        is_expected.to eq true
      end
      it '2文字以上であること: 1文字は×' do
        item.name = Faker::Lorem.characters(number: 1)
        is_expected.to eq false
      end
      it '30文字以下であること: 30文字は〇' do
        item.name = Faker::Lorem.characters(number: 30)
        is_expected.to eq true
      end
      it '30文字以下であること: 31文字は×' do
        item.name = Faker::Lorem.characters(number: 31)
        is_expected.to eq false
      end
    end

    context 'shop_nameカラム' do
      it '空欄でないこと' do
        item.shop_name = ''
        is_expected.to eq false
      end
      it '30文字以下であること: 30文字は〇' do
        item.name = Faker::Lorem.characters(number: 30)
        is_expected.to eq true
      end
      it '30文字以下であること: 31文字は×' do
        item.name = Faker::Lorem.characters(number: 31)
        is_expected.to eq false
      end
    end

    context 'detailカラム' do
      it '空欄でないこと' do
        item.detail = ''
        is_expected.to eq false
      end
      it '200文字以下であること: 200文字は〇' do
        item.detail = Faker::Lorem.characters(number: 200)
        is_expected.to eq true
      end
      it '200文字以下であること: 201文字は×' do
        item.detail = Faker::Lorem.characters(number: 201)
        is_expected.to eq false
      end
    end

    describe 'アソシエーションのテスト' do
      context 'Userモデルとの関係' do
        it 'N:1となっている' do
          expect(Item.reflect_on_association(:user).macro).to eq :belongs_to
        end
      end

      context 'Genreモデルとの関係' do
        it 'N:1となっている' do
          expect(Item.reflect_on_association(:genre).macro).to eq :belongs_to
        end
      end

      context 'ItemCommentモデルとの関係' do
        it '1:Nとなっている' do
          expect(Item.reflect_on_association(:item_comments).macro).to eq :has_many
        end
      end

      context 'Favoriteモデルとの関係' do
        it '1:Nとなっている' do
          expect(Item.reflect_on_association(:favorites).macro).to eq :has_many
        end
      end

      context 'CoordineteTableモデルとの関係' do
        it '1:Nとなっている' do
          expect(Item.reflect_on_association(:coordinete_tables).macro).to eq :has_many
        end
      end

      context 'Recommendationモデルとの関係' do
        it '1:Nとなっている' do
          expect(Item.reflect_on_association(:recommendations).macro).to eq :has_many
        end
      end
    end
  end
end
