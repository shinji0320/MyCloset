require 'rails_helper'

describe '[仕上げのテスト]' do
  let(:user) { create(:user) }
  let!(:other_user) { create(:user) }
  let!(:genre) { create(:genre) }
  let!(:item) { create(:item, user: user, genre: genre) }
  let!(:other_item) { create(:item, user:other_user, genre: genre) }

  describe 'サクセスメッセージのテスト' do
    subject { page }

    it 'ユーザ新規登録成功時' do
      visit new_user_registration_path
      fill_in 'user[name]', with: Faker::Lorem.characters(number: 9)
      fill_in 'user[email]', with: 'a' + user.email
      fill_in 'user[password]', with: 'password'
      fill_in 'user[password_confirmation]', with: 'password'
      click_button '登録'
      is_expected.to have_content 'アカウント登録に成功しました。'
    end
    it 'ユーザログイン成功時' do
      visit new_user_session_path
      fill_in 'user[email]', with: user.email
      fill_in 'user[password]', with: user.password
      click_button 'ログイン'
      is_expected.to have_content 'ログインしました。'
    end
    it 'ユーザログアウト成功時' do
      visit new_user_session_path
      fill_in 'user[email]', with: user.email
      fill_in 'user[password]', with: user.password
      click_button 'ログイン'
      logout_link = find_all('a')[4].native.inner_text
      logout_link = logout_link.gsub(/\n/, '').gsub(/\A\s*/, '').gsub(/\s*\Z/, '')
      click_link logout_link
      is_expected.to have_content 'ログアウトしました'
    end
    it 'ユーザのプロフィール情報更新成功時' do
      visit new_user_session_path
      fill_in 'user[email]', with: user.email
      fill_in 'user[password]', with: user.password
      click_button 'ログイン'
      visit edit_user_path(user)
      click_button '更新する'
      is_expected.to have_content '変更しました。'
    end
    it 'アイテムの新規投稿成功時' do
      visit new_user_session_path
      fill_in 'user[email]', with: user.email
      fill_in 'user[password]', with: user.password
      click_button 'ログイン'
      visit new_item_path
      genre_id = Faker::Number.between(from: 1, to: 6)
      select Genre.find(genre_id).name, from: 'item[genre_id]'
      fill_in 'item[name]', with: Faker::Lorem.characters(number: 20)
      fill_in 'item[shop_name]', with: Faker::Lorem.characters(number: 5)
      fill_in 'item[detail]', with: Faker::Lorem.characters(number: 20)
      click_button '登録する'
      is_expected.to have_content '登録できました'
    end
    it 'アイテムデータの更新成功時' do
      visit new_user_session_path
      fill_in 'user[email]', with: user.email
      fill_in 'user[password]', with: user.password
      click_button 'ログイン'
      visit edit_item_path(item)
      click_button '更新する'
      is_expected.to have_content '変更しました'
    end
  end

  describe '処理失敗時のテスト' do
    context 'ユーザ新規登録失敗: nameを1文字にする' do
      before do
        visit new_user_registration_path
        @name = Faker::Lorem.characters(number: 1)
        @prefecture = Faker::Lorem.characters(number: 5)
        @email = 'a' + user.email # 確実にuser, other_userと違う文字列にするため
        fill_in 'user[name]', with: @name
        fill_in 'user[email]', with: @email
        fill_in 'user[prefecture]', with: @prefecture
        fill_in 'user[password]', with: 'password'
        fill_in 'user[password_confirmation]', with: 'password'
      end

      it '新規登録されない' do
        expect { click_button '登録' }.not_to change(User.all, :count)
      end
      it '新規登録ページを表示しており、フォームの内容が正しい' do
        click_button '登録'
        expect(page).to have_content '登録'
        expect(page).to have_field 'user[name]', with: @name
        expect(page).to have_field 'user[email]', with: @email
        expect(page).to have_field 'user[prefecture]', with: @prefecture
      end
    end

    context 'ユーザのプロフィール情報編集失敗: nameを1文字にする' do
      before do
        @user_old_email = user.email
        @name = Faker::Lorem.characters(number: 1)
        visit new_user_session_path
        fill_in 'user[email]', with: @user_old_email
        fill_in 'user[password]', with: user.password
        click_button 'ログイン'
        visit edit_user_path(user)
        fill_in 'user[name]', with: @name
        click_button '更新する'
      end

      it '更新されない' do
        expect(user.reload.name).to eq @name
      end
      it 'ユーザ編集ページを表示しており、フォームの内容が正しい' do
        expect(page).to have_field 'user[name]', with: @name
      end
      it 'バリデーションエラーが表示される' do
        expect(page).to have_content "名前は2文字以上で入力してください"
      end
    end
  end

  describe 'アクセス制限のテスト: ログインページに遷移する' do
    subject { current_path }

    it 'ユーザ詳細画面' do
      visit user_path(user)
      is_expected.to eq '/users/sign_in'
    end
    it 'ユーザ情報編集画面' do
      visit edit_user_path(user)
      is_expected.to eq '/users/sign_in'
    end
    it '商品一覧画面' do
      visit items_path
      is_expected.to eq '/users/sign_in'
    end
    it '商品の登録画面' do
      visit new_item_path
      is_expected.to eq '/users/sign_in'
    end
    it '商品詳細画面' do
      visit item_path(item)
      is_expected.to eq '/users/sign_in'
    end
    it '商品編集画面' do
      visit edit_item_path(item)
      is_expected.to eq '/users/sign_in'
    end
    it 'コーディネート一覧画面' do
      visit coordinetes_path
      is_expected.to eq '/users/sign_in'
    end
  end

  describe '他人のページのテスト' do
    before do
      visit new_user_session_path
      fill_in 'user[email]', with: user.email
      fill_in 'user[password]', with: user.password
      click_button 'ログイン'
    end

    describe '他人の商品詳細ページのテスト' do
      before do
        visit item_path(other_item)
      end

      context '表示内容の確認' do
        it 'URLが正しい' do
          expect(current_path).to eq '/items/' + other_item.id.to_s
        end
        it '「アイテムの詳細」と表示される' do
          expect(page).to have_content 'アイテムの詳細'
        end
        it '名前のリンク先が正しい' do
          expect(page).to have_link other_item.user.name
        end
        it 'アイテムのジャンル名が表示される' do
          expect(page).to have_content other_item.genre_id
        end
        it 'アイテムの名前が表示される' do
          expect(page).to have_content other_item.name
        end
        it 'アイテムのブランド名が表示される' do
          expect(page).to have_content other_item.shop_name
        end
        it 'アイテムの説明が表示される' do
          expect(page).to have_content other_item.detail
        end
        it 'アイテムの編集リンクが表示されない' do
          expect(page).not_to have_link 'アイテムの編集'
        end
        it 'アイテムの削除リンクが表示されない' do
          expect(page).not_to have_link 'アイテムの削除'
        end
      end

      context '他人の商品編集ページ' do
        it '遷移できず、商品一覧ページにリダイレクトされる' do
          visit edit_item_path(other_item)
          expect(current_path).to eq '/items'
        end
      end
    end

    describe '他人のユーザ詳細ページのテスト' do
      before do
        visit user_path(other_user)
      end

      context '表示の確認' do
        it 'URLが正しい' do
          expect(current_path).to eq '/users/' + other_user.id.to_s
        end
      end

      context '他人のユーザ情報編集ページ' do
        it '遷移できず、自分のユーザ詳細ページにリダイレクトされる' do
          visit edit_user_path(other_user)
          expect(current_path).to eq '/users/' + user.id.to_s
        end
      end
    end
  end
end
