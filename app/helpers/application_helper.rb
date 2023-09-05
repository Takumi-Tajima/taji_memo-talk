module ApplicationHelper
  def page_title(page_title = '')
    base_title = "🌈 メモトーーク！"
    page_title.empty? ? base_title : page_title + ' | ' + base_title
  end
  
  def admin_page_title(page_title = '')
    base_title = "🌈【管理者画面】メモトーーク！"
    page_title.empty? ? base_title : page_title + ' | ' + base_title
  end
end
