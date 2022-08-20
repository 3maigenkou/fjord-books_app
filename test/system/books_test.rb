# frozen_string_literal: true

require 'application_system_test_case'

class BooksTest < ApplicationSystemTestCase
  setup do
    @book1 = books(:bottyan)
    @book2 = books(:maihime)

    Capybara.exact = true

    visit root_url
    fill_in 'Eメール', with: 'alice@example.com'
    fill_in 'パスワード', with: 'password'
    click_button 'ログイン'
  end

  test 'visiting the index' do
    visit books_url
    assert_selector 'h1', text: '本'
  end

  test 'creating a Book' do
    visit books_url
    click_on '新規作成'

    fill_in 'タイトル', with: '坊っちゃん'
    fill_in 'メモ', with: '道後温泉が舞台'
    fill_in '著者', with: '夏目漱石'
    click_on '登録する'

    assert_text '本が作成されました。'
    assert_text '坊っちゃん'
    assert_text '道後温泉が舞台'
    assert_text '夏目漱石'
  end

  test 'updating a Book' do
    visit books_url
    click_link '編集', match: :first

    fill_in 'タイトル', with: '舞姫'
    fill_in 'メモ', with: 'ドイツが舞台'
    fill_in '著者', with: '森鴎外'
    click_on '更新する'

    assert_text '本が更新されました。'
    assert_text '舞姫'
    assert_text 'ドイツが舞台'
    assert_text '森鴎外'
  end

  test 'destroying a Book' do
    visit books_url
    page.accept_confirm do
      click_on '削除', match: :first
    end

    assert_text '本が削除されました。'
    assert_no_text '舞姫'
  end
end
