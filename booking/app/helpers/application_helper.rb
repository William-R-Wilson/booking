module ApplicationHelper

  def formatted_date(d)
    d.strftime("%b %d %Y")
  end

  def abbreviated_date(d)
    d.strftime("%m-%d-%y")
  end

  def formatted_time(t)
    t.strftime("%l:%M %P")
  end

end
