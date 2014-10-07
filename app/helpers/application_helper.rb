module ApplicationHelper

  def get_has_many_assocations(options={})
    ul(AppStats::Stats.get_has_many_relationships, options)
  end

  # http://qerub.se/list-helper-for-rails
  def html_list(type, elements, options = {})
    if elements.empty?
      "" 
    else
      lis = elements.map{ |x| content_tag("li", x) }
      content_tag(type, lis.join.html_safe, options)
    end
  end

  def ul(*args)
    html_list("ul", *args)
  end

  def ol(*args)
    html_list("ol", *args)
  end
end
