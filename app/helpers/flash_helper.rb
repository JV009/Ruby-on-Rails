module FlashHelper
  TYPES_OF_ALERTS = {
  notice: 'success',
  alert: 'danger',
  error: 'danger',
  warning: 'warning',
  info: 'primary'
}.freeze

  def flash_message
    flash.map do |type, message|
      content_tag(:div, message, class: "alert alert-#{TYPES_OF_ALERTS[type.to_sym]}")
    end.join.html_safe
  end
end
