module ApplicationHelper
	def active_link_to(name = nil, options = nil, html_options = nil, &block)
	  active_class = html_options[:active] || "active"
	  html_options.delete(:active)
	  html_options[:class] = "#{html_options[:class]} #{active_class}" if current_page?(options)
	  link_to(name, options, html_options, &block)
	end

	def sortable(column, title = nil)
		title ||= column.titleize
		if sort_direction == "asc" 
			asc = "glyphicon glyphicon-triangle-top"
		else
			asc = "glyphicon glyphicon-triangle-bottom"
		end
		#css_class = column == sort_column ? "current #{asc}" : nil
		direction = column == sort_column && sort_direction == "asc" ? "desc" : "asc"
		link_to title, {:sort => column, :direction => direction}#, {:class => css_class}
	end
end
