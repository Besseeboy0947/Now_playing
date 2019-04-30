class NowPlaying::CLI

  def call 
    welcome
  end  # of call method

  def welcome
    puts 'Welcome to the list of Movies titles, that are Now playing!'
    puts 'For a list of Movies, type "list",or "exit" to exit.'
    input = gets.strip
    if input == "exit"
    elsif input == "list"
      list # gives user the list 
      choice_loop # lets all the choices run in a loop 
    else 
      puts "Sorry! I didn't understand that command"
      welcome
    end 

  end

  def list
    # 1. create a local variable called scraper and assign it to a new instance of NowPlaying::Scraper 
    # 2. use the scraper instance you just made to invoke both `get_titles` and `get_url`
    #NowPlaying::Scraper.new.get_titles
    #NowPlaying::Scraper.new.get_url
    scraper = NowPlaying::Scraper.new
    scraper.get_titles
    scraper.get_url
    @movie_list = NowPlaying::Movie.all
    idx = 1
       @movie_list.each do |movie|
          puts "#{ idx }. #{movie.title}"
          idx = idx + 1
        
        end

  end 

  def display_movie(choice)
    index = choice - 1
    movie = @movie_list[index]
    #NowPlaying::Scraper.new.get_description(@movie_list[index])
    puts @movie_list[index].title
    puts @movie_list[index].url
    puts @movie_list[index].description
  end

  def choice_loop
    puts " Which movie would you like to see more information about?"
    puts "Enter the number for the movie you would like a description of"
  
    
    #LOOKING 4 user's input here & validateS that it is acceptable (between 1-25, not nil, not negatice, not words....)
    #input = gets.strip.to_i
    # if the input is exit,then.. send back to bash
    input = gets.strip 
    if

    if input.to_i.between?(1,25)
       display_movie(input.to_i) #Recieved valid input
        choice_loop

    elsif input == "exit"
      puts "Thanks for Watching have a Great Day!!"
      puts "GOODBYE :)"
      #allows this method to end
    else   
        puts "invalid Entry"
        choice_loop

    end
  end

   #get user input and use that to return the movie
   # input = gets.strip.to_i until input.between(1,25) puts “Invalid Entry” input = gets.strip.to_i  
  end
 

  def get_movie_method #Mostly understood what i was doing till this point...
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
          choice_loop
      end
  end
end