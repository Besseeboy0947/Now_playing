class NowPlaying::CLI

  def call
    #system("clear")
    #sleep(1)
    welcome
    #something here that requires input before running list
    list
    choice_loop
#     input = nil 
#       while input != "exit"#loop
#      input = gets.strip 
#       case input
#       when "list"
#          NowPlaying::Movie.clear 
#          NowPlaying::Movie.create
#          # NowPlaying::Movie.list
#         puts "\n\nWhich movie would you like to see more information about?"
#         until input == "exit"
#           input = gets.strip
#                 nowplaying = NowPlaying.find_by_name(input)
               
#                   if nowplaying != nil                                                          
#                 puts "The #{nowplaying.name} is in Theaters now. This movie is rated #{nowplaying.rating} & IT'S ABOUT.... #{nowplaying.description}"

#                 elsif nowplaying == nil && input !="exit"
#                 puts "That is not a valid selection.\n\n"
            
#                   elsif input == "list"
#                   currency.list
#                   puts "\n\nWhich would you like a full description on?\n\n"
#                   end# of the if 
#               end# of loop
#             when "exit" #self explanatory
#         exit
#        input.to_i # forgot what this means 
#       when "input.to_i = +1 " #woah im lost 
#       end # of case 
#     end # of loop
#   end # of call
  end  # of class



def welcome
  puts 'Welcome to the list Movies titles, that are Now playing!'
  puts 'For a list of Movies, type "list",or "exit" to exit.'
end

def list
  NowPlaying::Scraper.new.get_titles
  NowPlaying::Scraper.new.get_url
  #NowPlaying::Scraper.new.get_description
  @movie_list = NowPlaying::Movie.all
  idx = 1
     @movie_list.each do |movie|
        puts "#{ idx }. #{movie.title}"
        idx = idx + 1
      
      end

end 

def find_by_name(choice)
  index = choice - 1
  puts @movie_list[index].title
  puts @movie_list[index].url
  puts @movie_list[index].description
end

def choice_loop
  puts " Which movie would you like to see more information about?"
  puts "Enter the number for the movie you would like a description of"
  #get real input here and validate that it is acceptable (between 1-25, not nil, not negatice, not words....)
  input = gets.strip.to_i
  if input.between?(1,25)
      find_by_name(input) #Recieved valid input
  else  
      puts "invalid Entry"
      choice_loop
  end
 #get user input and use that to return the movie
 # input = gets.strip.to_i until input.between(1,25) puts “Invalid Entry” input = gets.strip.to_i  
end
# end  find_by_name(input) 

  def get_movie_method
        input = gets.strip   #"A Private War"   "exit"
           index =  input.to_i - 1
        if index.between?(0,99)   #a string will be -1
        movie = @sorted_movies[index]
          puts "#{movie.title}:"
          puts "Rotten Tomatoes was liked by #{movie.rating} of people "
          puts "#{movie.critic}"
        want_more_info(movie)

        elsif input == "exit"
            #allow this method to end
        else
          puts "Sorry! I didn't understand that command"
          get_movie_method   #recursion
      end
  end
end