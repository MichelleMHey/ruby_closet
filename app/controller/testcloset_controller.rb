class TestClosetController

  def initialize
  end

  def generate_clothes
    puts "Please first put the type of clothing: . Type one of the following categories: 'Pants', 'Blouse', 'Dress', 'Active Wear', 'Shoes', 'Shirt', and 'Jacket.'"
  end

  def list
    puts "Here is your current closet inventory."
    clothings = Clothing.all
    clothings.each_with_index do |clothes, i|
      puts "#{i+1}. #{clothes.name} #{clothes.style} #{clothes.temperature}"
    end
  end

  def add
    puts "Please add the name of the clothing, style of clothing, and temperature of clothing (ex: hot, cold, warm). Enter text like this(Skirt, Dressy, Warm)."

    stop_loop = false
    clothes = Clothing.new

    until stop_loop do
      print "Name: "
      clothing_name = gets.chomp
      clothes.name = clothing_name

      while true
        print "Style (casual/work/dressy/active): "
        clothing_style = gets.chomp
        if ['casual', 'work', 'dressy', 'active'].include? clothing_style
          clothes.style = clothing_style
          break
        else
         puts "Please type one of the following values: (casual/work/dressy/active)"
        end
      end

      print "Temperature (hot/warm/cool/cold): "
      clothing_temperature = gets.chomp
        if ['hot', 'warm', 'cool', 'cold'].include? clothing_temperature
          clothes.temperature = clothing_temperature
          break
        else
          puts "Please type one of the following values: (hot/warm/cool/cold)"
        end

      print "Type of clothing (top/bottom/shoes/dress/jacket): "
      clothing_type = gets.chomp
      if ['top', 'bottom', 'shoes', 'dress', 'jacket'].include? clothing_type
        clothes.clothing_type = clothing_type
        break
      else
        puts "Please type one of the following values: (top/bottom/shoes/dress/jacket)"
      end

      puts "This is what I have. Is this correct? (y/n)"
      puts "#{clothes.name}\t#{clothes.style}\t#{clothes.temperature}\t#{clothes.clothing_type}"

      confirm = gets.chomp
      stop_loop = confirm == "y"
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

  def generate

  end
end