module ApplicationsHelper

  def flash_class(level)
    case level
      when 'notice' then "alert alert-primary alert-dismissible bg-primary text-white border-0 fade show"
      when 'success' then "alert alert-success alert-dismissible bg-success text-white border-0 fade show"
      when 'error' then "alert alert-danger alert-dismissible bg-danger text-white border-0 fade show"
      when 'alert' then "alert alert-warning alert-dismissible fade show"
    end
  end


end
