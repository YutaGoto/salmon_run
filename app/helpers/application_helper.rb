# typed: false
module ApplicationHelper
  def l(*args)
    I18n.l(*args)
  rescue StandardError
    ''
  end
end
