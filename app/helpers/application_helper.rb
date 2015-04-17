module ApplicationHelper
  def title(value)
    unless value.nil?
      @title = "#{value} | Onholiday"
    end
  end
end
