module ApplicationHelper
	include Apis::eventful

  def get_first_title_result
    title = get_title()
    html = '<h1>'+title+'</h1>'
    raw html
  end
end
