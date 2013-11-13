module CustomHelpers
  def body_id
  end

  def format_date(date)
    today = Date.today
    if date.year == today.year
      date.strftime('%b %e')
    else
      date.strftime('%b %e %Y')
    end
  end

  def page_title
    default_title = "Site Title"
    current_page.data.title ? "#{current_page.data.title} | #{default_title}" : default_title
  end

  def custom_page_classes
    (@custom_page_classes || []).join(' ')
  end

  def set_custom_page_classes(classes)
    @custom_page_classes = (@custom_page_classes || []).concat classes.split(' ')
  end
end
