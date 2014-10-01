module ApplicationHelper
	include Apis::Eventful

  def get_first_title_result(result)
    title = get_title()
    html = '<h1>'+title+'</h1>'
    raw html
  end
end
