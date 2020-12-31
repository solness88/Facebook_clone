require 'rails_helper'
describe 'タスク管理機能', type: :system do
  describe '一覧表示機能' do
    context '一覧画面に遷移した場合' do
      it '作成済みのタスク一覧が表示される' do
        task = FactoryBot.create(:task,
                                  task_name = "東京",
                                  detail = "大阪",
                                  deadline = "福岡",
                                  status = "札幌",
                                  detail = "京都")
        vist tasks_path
        expect(page).to have_content 'task'
