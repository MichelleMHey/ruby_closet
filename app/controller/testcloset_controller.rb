class TestClosetController
  include Formatter

  def initialize params
    @params = params
  end

  def index
    clothings = Clothing.all
    clothings.each_with_index do |clothes, i|
      puts "#{i+1}. #{clothes.name}"
    end
  end

  def create
    clothes = Clothing.new(name: clothes)
    if clothes.save
      puts "Success!"
    else
      puts "Failure :( #{clothes.errors.full_messages.join(", ")}"
    end
  end

  def destroy
    matching_clothes = Clothing.where(name: params[:clothes][:name]).all
    matching_clothes.each do |clothes|
      Clothing.destroy
    end
  end

  def params
    @params
  end
end