require 'nokogiri'
require 'open-uri' 
require 'pry'

class NowPlaying::Scraper

	def initialize 
		@html = Nokogiri::HTML(open("https://www.fandango.com/moviesintheaters"))
	end

	    
	 def get_titles		#maybe rename to get_movie_details
	 	@@movies = Array.new(25)
	    # binding.pry #what is title ? how to access the rest of the movie properties like url or description	
		# Not understanding yet 
		# items = @html.css("movie-ls-group").css("visual-item")
 		 
 		 @html.css(".visual-title")[0..24].each.with_index do |title, i| 		 	
 			#.gsub = (a,b)replace all "a" with "b" 
 			#.strip = removes all white space on both sides
 			@@movies[i] = NowPlaying::Movie.new 
 		    @@movies[i].title = title.text.gsub("\r\n","").strip 		
 		 end
 	  end
 		# @html.css("a.visual-title")[0]["href"] this is the url!


      def  get_url
         @html.css("a.visual-title")[0..24].each.with_index do |url, i|
          @@movies[i].url = url["href"].gsub("http","https")
	  end  
 		# @html.css("gets whatever you need ")[0..24].each.with_index do |thing, i|
 			#movies[i].thing = whatever nokogiri
 		  #end
 		# iterators
 		# .each = returns the orginal array
 		# books = []
 		# library = [harry_potter, narnia, dr_suess]
 		# library.each do |a|  #library[2] 
 		#     books << a
 		#  end 
 		# books

 		# album = [beat_it, thriller, smooth_criminal]
 		# songs = album.map do |b| #album[0]
 		#    b
 		# end
 		# .map = returns modified array
		
	 end 

	

   def get_description(movie)
   	@html = Nokogiri::HTML(open(movie.url))
   	movie.description = @html.css(".mop__synopsis-content").text.strip
 	#https://www.fandango.com/escape-room-2019-215085/plot-summary
 	#movie-synopsis__body
 	#description = @html.css("movie-synopsis__body").strip

   end
end