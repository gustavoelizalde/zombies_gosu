class Zombie
  def initialize(x, y, speed = 1)
    @x = x
    @y = y
    @directions = ["left", "right", "up", "down"]
    @direction = "right"
    @image = Gosu::Image.new("zombie.png")
    @steps = 0
    @speed = speed
  end

  def update
    walk()
  end

  def draw
    if @direction == "right"
      @image.draw_rot(@x, @y, z = 1, angle = 0, 0.5, 0.5)
    elsif @direction == "down"
      @image.draw_rot(@x, @y, z = 1, angle = 90, 0.5, 0.5)
    elsif @direction == "left"
      @image.draw_rot(@x, @y, z = 1, angle = 180, 0.5, 0.5)
    elsif @direction == "up"
      @image.draw_rot(@x, @y, z = 1, angle = 270, 0.5, 0.5)
    end
  end

  def walk
    if @direction == "right"
      @x += @speed
    elsif @direction == "left"
      @x -= @speed
    elsif @direction == "up"
      @y -= @speed
    elsif @direction == "down"
      @y += @speed
    end

    if @steps >= 50
      @direction = @directions.sample
      @steps = 0
    end

    @steps += @speed

  end
end