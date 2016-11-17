module ApplicationHelper
  def format_datetime(datatime)
    if datatime.blank?
      return ''
    end
    datatime.strftime("%Y.%m.%d %H:%M:%S")
  end
end
