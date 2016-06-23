require 'gosu'
require_relative 'zombie'

class MyWindow < Gosu::Window
  def initialize
    super(900, 700)
    self.caption = 'Hello World!'
    @zombies = []
    File.open("zombies.txt", "r",).readlines.each do |line|
      coords = line.split(",")
      coords.map!(&:to_i)
      @zombies << Zombie.new(coords[0], coords[1])
    end
  end

  def update
    @zombies.each do |z|
      z.update
    end
  end

  def draw
    @zombies.each do |z|
      z.draw
    end

  end
end

window = MyWindow.new
window.show