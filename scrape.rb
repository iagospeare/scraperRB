require 'nokogiri'
require 'mechanize'


#mechanize uses the nokogiri gem to parse
scraper = Mechanize.new

page = scraper.get('http://www.schottensteincenter.com/events')
html_doc = Nokogiri::HTML(page.body)
#get all of the events
nodes =  html_doc.css("div.info")
titles = []
INFO = []
INFO <<['Website', 'Time', 'Name', 'Presenters']
#putting raw information in document named 'entire_list'
File.open('entire_list', 'w'){ |f|
	nodes.each do |event|
		title = event.css('a').xpath('text()')
		date = event.css('div.date')
		link = event.css('a')[0]["href"]
		f.puts title
		f.puts link
		titles << title
		#INFO << [link, time, name, presented_by]
	end
}

#creating array of arrays with information stored







