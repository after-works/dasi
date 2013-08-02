module ApplicationHelper
  def convert_time (time)
    time.localtime.strftime("%y.%m.%d %I:%M %p")
  end
end
