module ApplicationHelper
  def mobile_device?
    if session[:mobile_param]
      session[:mobile_param] == "1"
    else
      request.user_agent =~ /Mobile|webOS/
    end
  end


    def flash_class(level)
    case level
      when 'notice' then "jq-toast-single jq-has-icon jq-icon-info"
      when 'success' then "jq-toast-single jq-has-icon jq-icon-success"
      when 'error' then "jq-toast-single jq-has-icon jq-icon-error"
      when 'alert' then "jq-toast-single jq-has-icon jq-icon-warning"
    end
  end



end
