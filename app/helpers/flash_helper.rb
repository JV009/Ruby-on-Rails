module FlashHelper
  
  def flash_message
    flash.map do |type, message|
      content_tag(:p, message, class: "flash #{type}")
    end.join.html_safe
  end
end
