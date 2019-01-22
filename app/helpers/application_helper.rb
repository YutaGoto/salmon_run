module ApplicationHelper
  def l(*args)
    I18n.l(*args) rescue ''
  end
end
