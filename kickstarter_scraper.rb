# file:kickstarter_scraper.rb 

require 'nokogiri'
require 'pry'


def find_my_way_project
 
html =
File.read('fixtures/kickstart
er.html')
kickstarter =
Nokogiri::HTML(html)
  binding.pry
end

 projects: kickstarter.css("li.project.grid_4")
 title: project.css("h2.bbcard_name strong a").text
 image link: project.css("div.project-thumbnail a img").attribute("src").value
 description: project.css("p.bbcard_blurb").text
 location: project.css("ul.project-meta span.location-name").text
 percent_funded: project.css("ul.project-stats li.first.funded strong").text.gsub("%","").to_i
 
 end
 
def create_project_hash
  html =
File.read('features/kickstart
er.html')
  kickstarter = 
Nokogiri::HTML(html)

  projects = {}
  
#iterate through the 
projects

  kickstarter.css("li.project
  .grid_4).each do |project|
      projects[project] = {}
  end
  
  
  # return the projects create_project_hash
  projects
end

end

def create_project_hash
  projects = {}
 
  kickstarter.css("li.project.grid_4").each do |project|
    title = project.css("h2.bbcard_name strong a").text
    projects[title.to_sym] = {:image_link => project.css("div.project-thumbnail a img").attribute("src").value,
      :description => project.css("p.bbcard_blurb").text,
      :location => project.css("ul.project-meta span.location-name").text,
      :percent_funded => project.css("ul.project-stats li.first.funded strong").text.gsub("%","").to_i
    }
  end
 
  # return the projects hash
  projects
end

