module StaticPagesHelper
	def test(event)
		e = event
		# if e['categories']['category'].match(/^{/)
		# 	my_event = "[#{e['categories']['category']}]"
		# else
		# 	my_event = e['categories']['category']
		# end
		cat = ""
		e['categories']['category'].each do |cat|
			cat = cat + i.to_s
		end
		return cat
	end
end
