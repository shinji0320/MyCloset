require 'rails_helper'

describe '[STEP2] ユーザログイン後のテスト' do
  let(:user) { create(:user) }
  let!(:other_user) { create(:user) }
  let!(:genre) { create(:genre) }
  let!(:item) { create(:item, user: user, genre: genre) }
  let!(:other_item) { create(:item, user: other_user, genre: genre) }

  before do
    visit new_user_session_path
    fill_in 'user[email]', with: user.email
    fill_in 'user[password]', with: user.password
    click_button 'ログイン'
  end

  describe 'ヘッダーのテスト: ログインしている場合' do
    context 'リンクの内容を確認' do
      subject { current_path }

      it 'MyClosetを押すと、Myページに遷移する' do
        user_link = find_all('a')[1].native.inner_text
        user_link = user_link.gsub(/\n/, '').gsub(/\A\s*/, '').gsub(/\s*\Z/, '')
        click_link user_link
        is_expected.to eq '/users/' + user.id.to_s
      end
      it '投稿一覧を押すと、商品一覧覧画面に遷移する' do
        items_link = find_all('a')[2].native.inner_text
        items_link = items_link.gsub(/\n/, '').gsub(/\A\s*/, '').gsub(/\s*\Z/, '')
        click_link items_link
        is_expected.to eq '/items'
      end
      it '投稿フォームを押すと、投稿フォームに遷移する' do
        new_item_link = find_all('a')[3].native.inner_text
        new_item_link = new_item_link.gsub(/\n/, '').gsub(/\A\s*/, '').gsub(/\s*\Z/, '')
        click_link new_item_link
        is_expected.to eq '/items/new'
      end
    end
  end

  describe '商品一覧画面のテスト' do
    before do
      visit items_path
    end

    context '表示内容の確認' do
      it 'URLが正しい' do
        expect(items_path).to eq '/items'
      end
    end
  end

  describe '自分の商品詳細画面のテスト' do
    before do
      visit item_path(item)
    end

    context '表示内容の確認' do
      it 'URLが正しい' do
        expect(current_path).to eq '/items/' + item.id.to_s
      end
      it 'ユーザ画像・名前のリンク先が正しい' do
        expect(page).to have_link item.user.name, href: user_path(item.user)
      end
      it '商品の編集リンクが表示される' do
        expect(page).to have_link 'アイテムを編集', href: edit_item_path(item)
      end
      it '商品の削除リンクが表示される' do
        expect(page).to have_link 'アイテムを削除', href: item_path(item)
      end
    end
  end

  describe '商品登録のテスト' do
    before do
      visit new_item_path
    end

    context '商品登録成功のテスト' do
      before do
        genre_id = Faker::Number.between(from: 1, to: 6)
        select Genre.find(genre_id).name, from: 'item[genre_id]'
        fill_in 'item[name]', with: Faker::Lorem.characters(number: 10)
        fill_in 'item[shop_name]', with: Faker::Lorem.characters(number: 10)
        fill_in 'item[detail]', with: Faker::Lorem.characters(number: 30)
        choose "item_private_false"
        # 非公開ページのみになっている。ランダムに判定させたい
        # fill_in 'item[private]', with: Faker::Boolean.boolean(true_ratio: 0.2)
      end

      it '自分の新しい商品が正しく保存される' do
        expect { click_button '登録する' }.to change(user.items, :count).by(1)
      end
    end
  end

  describe '商品登録のテスト' do
    before do
      visit item_path(item)
    end

    context '編集リンクのテスト' do
      it '編集画面に遷移する' do
        click_link 'アイテムを編集'
        expect(current_path).to eq '/items/' + item.id.to_s + '/edit'
      end
    end

    context '削除リンクのテスト' do
      before do
        click_link 'アイテムを削除'
      end

      it '正しく削除される' do
        expect(Item.where(id: item.id).count).to eq 0
      end
      it 'リダイレクト先が、商品一覧画面になっている' do
        expect(current_path).to eq '/items'
      end
    end
  end

  describe '自分の商品編集画面のテスト' do
    before do
      visit edit_item_path(item)
    end

    context '表示の確認' do
      it 'URLが正しい' do
        expect(current_path).to eq '/items/' + item.id.to_s + '/edit'
      end
      it 'ジャンル編集フォームが表示される' do
        expect(page).to have_field 'item[genre_id]', with: item.genre_id
      end
      it 'アイテム名編集フォームが表示される' do
        expect(page).to have_field 'item[name]', with: item.name
      end
      it 'ブランド名編集フォームが表示される' do
        expect(page).to have_field 'item[shop_name]', with: item.shop_name
      end
      it '説明編集フォームが表示される' do
        expect(page).to have_field 'item[detail]', with: item.detail
      end
      it '更新するボタンが表示される' do
        expect(page).to have_button '更新する'
      end
    end

    context '編集成功のテスト' do
      before do
        @item_old_genre_id = item.genre_id
        @item_old_name = item.name
        @item_old_shop_name = item.shop_name
        @item_old_detail = item.detail
        genre_id = Faker::Number.between(from: 1, to: 6)
        select Genre.find(genre_id).name, from: 'item[genre_id]'
        fill_in 'item[name]', with: Faker::Lorem.characters(number: 10)
        fill_in 'item[shop_name]', with: Faker::Lorem.characters(number: 4)
        fill_in 'item[detail]', with: Faker::Lorem.characters(number: 10)
        choose "item_private_false"
        click_button '更新する'
      end

      it 'ジャンル名が正しく更新される' do
        expect(item.reload.genre_id).not_to eq @item_old_genre_id
      end
      it 'アイテム名が正しく更新される' do
        expect(item.reload.name).not_to eq @item_old_name
      end
      it 'ブランド名が正しく更新される' do
        expect(item.reload.shop_name).not_to eq @item_old_shop_name
      end
      it '説明が正しく更新される' do
        expect(item.reload.detail).not_to eq @item_old_detail
      end
      it 'リダイレクト先が、更新した投稿の詳細画面になっている' do
        expect(current_path).to eq '/items/' + item.id.to_s
        expect(page).to have_content 'アイテムの詳細'
      end
    end
  end

  describe '自分のユーザ詳細画面のテスト' do
    before do
      visit user_path(user)
    end

    context '表示の確認' do
      it 'URLが正しい' do
        expect(current_path).to eq '/users/' + user.id.to_s
      end
      it 'アイテム一覧のユーザ画像のリンク先が正しい' do
        expect(page).to have_link '', href: user_path(user)
      end
      it '他人の投稿は表示されない' do
        expect(page).not_to have_link '', href: user_path(other_user)
      end
    end
  end

  describe '自分のユーザ情報編集画面のテスト' do
    before do
      visit edit_user_path(user)
    end

    context '表示の確認' do
      it 'URLが正しい' do
        expect(current_path).to eq '/users/' + user.id.to_s + '/edit'
      end
      it '名前編集フォームに自分の名前が表示される' do
        expect(page).to have_field 'user[name]', with: user.name
      end
      it '自己紹介編集フォームに自分の自己紹介文が表示される' do
        expect(page).to have_field 'user[introduction]', with: user.introduction
      end
      it '都道府県編集フォームに自分の都道府県が表示される' do
        expect(page).to have_field 'user[prefecture]', with: user.prefecture
      end
      it '画像編集フォームが表示される' do
        expect(page).to have_field 'user[profile_image]'
      end
      it '更新するボタンが表示される' do
        expect(page).to have_button '更新する'
      end
    end

    context '更新成功のテスト' do
      before do
        @user_old_name = user.name
        @user_old_intrpduction = user.introduction
        @user_old_prefecture = user.prefecture
        fill_in 'user[name]', with: Faker::Lorem.characters(number: 10)
        fill_in 'user[introduction]', with: Faker::Lorem.characters(number: 15)
        fill_in 'user[prefecture]', with: Faker::Lorem.characters(number: 5)
        click_button '更新する'
      end

      it 'nameが正しく更新される' do
        expect(user.reload.name).not_to eq @user_old_name
      end
      it 'introductionが正しく更新される' do
        expect(user.reload.introduction).not_to eq @user_old_intrpduction
      end
      it 'prefectureが正しく更新される' do
        expect(user.reload.prefecture).not_to eq @user_old_prefecture
      end
      it 'リダイレクト先が、自分のユーザ詳細画面になっている' do
        expect(current_path).to eq '/users/' + user.id.to_s
      end
    end
  end
end
