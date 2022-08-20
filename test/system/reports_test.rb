# frozen_string_literal: true

require 'application_system_test_case'

class ReportsTest < ApplicationSystemTestCase
  setup do
    @report1 = reports(:day_one)
    @report2 = reports(:day_two)

    Capybara.exact = true

    visit root_url
    fill_in 'Eメール', with: 'alice@example.com'
    fill_in 'パスワード', with: 'password'
    click_button 'ログイン'
  end

  test 'visiting the index' do
    visit reports_url
    assert_selector 'h1', text: '日報'
  end

  test 'creating a Report' do
    visit reports_url
    click_on '新規作成'

    fill_in 'タイトル', with: '1日目'
    fill_in '内容', with: '初めての日報です。'
    click_on '登録する'

    assert_text '日報が作成されました。'
    assert_text '1日目'
    assert_text '初めての日報です。'
  end

  test 'updating a Report' do
    visit reports_url
    click_link '編集', match: :first

    fill_in 'タイトル', with: '2日目'
    fill_in '内容', with: '2日目の日報です。'
    click_on '更新する'

    assert_text '日報が更新されました。'
    assert_text '2日目'
    assert_text '2日目の日報です'
  end

  test 'destroying a Report' do
    visit reports_url
    page.accept_confirm do
      click_on '削除', match: :first
    end

    assert_text '日報が削除されました。'
    assert_no_text '2日目'
  end
end
