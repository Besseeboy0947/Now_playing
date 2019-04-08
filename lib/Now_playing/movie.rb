class NowPlaying::Movie

	attr_accessor :name, :url, :releasedate, :title, :description, :movie_page, :synopsis_url

	@@all = []

	def initialize(name = nil, url= nil, releasedate = nil, title = nil, description = nil, movie_page = nil, synopsis_url = nil)
 		@name = name
 		@title = title
 		@url = url 
 		@releasedate = releasedate
 		@description = description
 		@movie_page = movie_page
 		@synopsis_url = synopsis_url
 		@@all << self
	end

	def save 
 		@@all << self 
 	end 

 	def self.all
		@@all
	end

	def self.clear
	 @@all = []
	end


   def self.create
 		movies = NowPlaying::Movie.all
 		m = movies # need to add .filter method with do block
 	# puts m.description # Trying to add loop of movies description
 		scraper = NowPlaying::Scraper.new
  		scraper.get_titles 

  		#scraper.get_titles returns an array of all the titles
  		#we are storing that array in titles to be used again later
  		titles = scraper.get_titles
  	end
    
    # titles.each do |title|
    #NowPlaying::Movie.new #.new instantiates a new instance of an object and calls initialize method
    #end


	def self.list  #Beginning of do
		list = []
		self.all.each do |nowPlaying|
			# list << nowplaying.name
	    end

	   list.sort.each do |nowplaying_name|
	   	puts nowplaying_name
	   	 
	    end
 
    end
end


