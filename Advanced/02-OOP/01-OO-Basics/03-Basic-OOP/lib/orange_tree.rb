class OrangeTree
  # TODO: Implement all the specs defined in the README.md :)

  attr_reader :fruits

  def initialize
    @life_cycle = 0
    @fruits = 0
  end

  def height
    height = 10 # maximum height

    if @life_cycle <= 10
      height = @life_cycle
    end

    height
  end

  def one_year_passes!
    @life_cycle += 1

    if @life_cycle > 5 && @life_cycle <= 10
      @fruits = 100
    elsif @life_cycle > 10 && @life_cycle <= 15
      @fruits  = 200
    else
      @fruits = 0
    end
  end

  def dead?
    result = true #TODO: deal with probability...

    if @life_cycle <= 50
      result = false
    end

    result
  end

  def pick_a_fruit!
    @fruits -= 1
  end

end
