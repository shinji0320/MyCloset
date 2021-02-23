require 'rails_helper'

describe '[STEP2] ユーザログイン後のテスト' do
  let(:user) { create(:user) }
  let!(:other_user) { create(:user) }
  let!(:item) { create(:item, user: user) }
  let!(:other_item) { create(:item, user: other_user) }

  before do
    visit new_user_session_path
    fill_in 'user[name]', with: user.name
    fill_in 'user[password]', with: user.password
    click_button 'ログイン'
  end

  describe 'ヘッダーのテスト: ログインしている場合' do
    context 'リンクの内容を確認: ※logoutは『ユーザログアウトのテスト』でテスト済みになります。' do
      subject { current_path }

      it 'MyClosetを押すと、自分の商品ページに遷移する' do
        item_link = find_all('a')[1].native.inner_text
        item_link = item_link.gsub(/\n/, '').gsub(/\A\s*/, '').gsub(/\s*\Z/, '')
        click_link item_link
        is_expected.to eq '/item/' + item.id.to_s
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
        is_expected.to eq '/items' + new.to_s
      end
    end
  end

  describe '商品一覧画面のテスト' do
    before do
      visit items_path
    end

    context '表示内容の確認' do
      it 'URLが正しい' do
        expect(current_path).to eq '/items'
      end
      it '自分と他人の画像のリンク先が正しい' do
        expect(page).to have_link '', href: user_path(item.user)
        expect(page).to have_link '', href: user_path(other_item.user)
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

    context '商品登録成功のテスト' do
      before do
        fill_in 'item[genre_id]', with: Faker::Lorem.characters(number: 5)
        fill_in 'item[name]', with: Faker::Lorem.characters(number: 10)
        fill_in 'item[shop_name]', with: Faker::Lorem.characters(number: 10)
        fill_in 'item[detail]', with: Faker::Lorem.characters(number: 30)
        # 本来だとbooleanで公開・非公開選択できるがわからないのでRspecで書き方調べる
      end

      it '自分の新しい商品が正しく保存される' do
        expect { click_button '登録する' }.to change(user.items, :count).by(1)
      end
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
      it '「Editing Book」と表示される' do
        expect(page).to have_content 'Editing Book'
      end
      it 'title編集フォームが表示される' do
        expect(page).to have_field 'book[title]', with: book.title
      end
      it 'opinion編集フォームが表示される' do
        expect(page).to have_field 'book[body]', with: book.body
      end
      it 'Update Bookボタンが表示される' do
        expect(page).to have_button 'Update Book'
      end
      it 'Showリンクが表示される' do
        expect(page).to have_link 'Show', href: book_path(book)
      end
      it 'Backリンクが表示される' do
        expect(page).to have_link 'Back', href: books_path
      end
    end

    context '編集成功のテスト' do
      before do
        @book_old_title = book.title
        @book_old_body = book.body
        fill_in 'book[title]', with: Faker::Lorem.characters(number: 4)
        fill_in 'book[body]', with: Faker::Lorem.characters(number: 19)
        click_button 'Update Book'
      end

      it 'titleが正しく更新される' do
        expect(book.reload.title).not_to eq @book_old_title
      end
      it 'bodyが正しく更新される' do
        expect(book.reload.body).not_to eq @book_old_body
      end
      it 'リダイレクト先が、更新した投稿の詳細画面になっている' do
        expect(current_path).to eq '/books/' + book.id.to_s
        expect(page).to have_content 'Book detail'
      end
    end
  end

  describe 'ユーザ一覧画面のテスト' do
    before do
      visit users_path
    end

    context '表示内容の確認' do
      it 'URLが正しい' do
        expect(current_path).to eq '/users'
      end
      it '自分と他人の画像が表示される: fallbackの画像がサイドバーの1つ＋一覧(2人)の2つの計3つ存在する' do
        expect(all('img').size).to eq(3)
      end
      it '自分と他人の名前がそれぞれ表示される' do
        expect(page).to have_content user.name
        expect(page).to have_content other_user.name
      end
      it '自分と他人のshowリンクがそれぞれ表示される' do
        expect(page).to have_link 'Show', href: user_path(user)
        expect(page).to have_link 'Show', href: user_path(other_user)
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
      it '投稿一覧のユーザ画像のリンク先が正しい' do
        expect(page).to have_link '', href: user_path(user)
      end
      it '投稿一覧に自分の投稿のtitleが表示され、リンクが正しい' do
        expect(page).to have_link book.title, href: book_path(book)
      end
      it '投稿一覧に自分の投稿のopinionが表示される' do
        expect(page).to have_content book.body
      end
      it '他人の投稿は表示されない' do
        expect(page).not_to have_link '', href: user_path(other_user)
        expect(page).not_to have_content other_book.title
        expect(page).not_to have_content other_book.body
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
      it '画像編集フォームが表示される' do
        expect(page).to have_field 'user[profile_image]'
      end
      it '自己紹介編集フォームに自分の自己紹介文が表示される' do
        expect(page).to have_field 'user[introduction]', with: user.introduction
      end
      it 'Update Userボタンが表示される' do
        expect(page).to have_button 'Update User'
      end
    end

    context '更新成功のテスト' do
      before do
        @user_old_name = user.name
        @user_old_intrpduction = user.introduction
        fill_in 'user[name]', with: Faker::Lorem.characters(number: 9)
        fill_in 'user[introduction]', with: Faker::Lorem.characters(number: 19)
        click_button 'Update User'
      end

      it 'nameが正しく更新される' do
        expect(user.reload.name).not_to eq @user_old_name
      end
      it 'introductionが正しく更新される' do
        expect(user.reload.introduction).not_to eq @user_old_intrpduction
      end
      it 'リダイレクト先が、自分のユーザ詳細画面になっている' do
        expect(current_path).to eq '/users/' + user.id.to_s
      end
    end
  end
end
