class RubyClosetController

  def initialize
  end
  
  def ask_info(request_message, can_choose, error_message)
    while true
      print request_message
      user_info = gets.chomp
      if can_choose.include? user_info
        return user_info
      else
        puts error_message
      end
    end
  end
  
  def ask_style
    request_message = "Style (casual/work/dressy/active): " 
    can_choose = ['casual', 'work', 'dressy', 'active']
    error_message = "Please type one of the following values: (casual/work/dressy/active)"
    ask_info(request_message, can_choose, error_message)
  end

  def ask_temperature
    request_message = "Temperature (hot/warm/cool/cold): "
    can_choose = ['hot', 'warm', 'cool', 'cold']
    error_message = "Please type one of the following values: (hot/warm/cool/cold)"
    ask_info(request_message, can_choose, error_message)
  end

  def get_clothing(style, temperature, clothing_type)
    Clothing.where("style = ? AND temperature = ? AND clothing_type = ?", style, temperature, clothing_type)
  end

  def available_clothes(available_message, collection)
    if collection.empty?
      puts available_message
      return false
    end
    true
  end

  def generate

    style = ask_style
    temperature = ask_temperature
    
    tops = get_clothing(style, temperature, 'top')
    bottoms = get_clothing(style, temperature, 'bottom')
    shoes = get_clothing(style, temperature, 'shoes')

    all_available = true
    if tops.empty?
      puts "Don't have any tops."
      all_available = false
    end

    if bottoms.empty?
      puts "Don't have any bottoms."
      all_available = false
    end

    if shoes.empty?
      puts "Don't have any shoes."
      all_available = false
    end

    if all_available
      puts tops.shuffle![0].name
      puts bottoms.shuffle![0].name
      puts shoes.shuffle![0].name
    end
  end

  def list
    puts "Here is your furrent closet inventory."
    clothings = Clothing.all
    clothings.each_with_index do |clothes, i|
      puts "#{i+1}. #{clothes.name} #{clothes.style} #{clothes.temperature} #{clothes.clothing_type}"
    end
  end

  def add
    puts "Please add the name of the clothing:"

    clothes = Clothing.new

    while true
      print "Name: "
      clothing_name = gets.chomp
      clothes.name = clothing_name

      while true
        puts "Please add the style of clothing:"
        print "Style (casual/work/dressy/active): "
        clothing_style = gets.chomp
        if ['casual', 'work', 'dressy', 'active'].include? clothing_style
          clothes.style = clothing_style
          break
        else
         puts "Please type one of the following values: (casual/work/dressy/active)"
        end
      end

      while true
        puts "Please add the temperature of the clothing:"
        print "Temperature (hot/warm/cool/cold): "
        clothing_temperature = gets.chomp
        if ['hot', 'warm', 'cool', 'cold'].include? clothing_temperature
          clothes.temperature = clothing_temperature
          break
        else
          puts "Please type one of the following values: (hot/warm/cool/cold)"
        end
      end

      while true
        puts "Please add the type of clothing:"
        print "Type of clothing (top/bottom/shoes/dress/jacket): "
        clothing_type = gets.chomp
        if ['top', 'bottom', 'shoes', 'dress', 'jacket'].include? clothing_type
          clothes.clothing_type = clothing_type
          break
        else
          puts "Please type one of the following values: (top/bottom/shoes/dress/jacket)"
        end
      end

      puts "This is what I have. Is this correct? (y/n)"
      puts "#{clothes.name}\t#{clothes.style}\t#{clothes.temperature}\t#{clothes.clothing_type}"

      confirm = gets.chomp
      if confirm == "y"
        break
      end
    end

    if clothes.save 
      puts "Success! New clothing added!"
    else
      puts "Failure :( #{clothes.errors.full_messages.join(", ")}"
    end
  end

  def remove
    puts "What clothing would you like to remove?"
    clothing_name = gets.chomp
    matching_clothes = Clothing.where(name: clothing_name).all
    matching_clothes.each do |clothes|
      clothes.destroy
    end
  end

end