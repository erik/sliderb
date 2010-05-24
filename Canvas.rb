require "java"
require 'Loader'

JPanel = javax.swing.JPanel
Color = java.awt.Color
Font = java.awt.Font

  #Format of data:
  #   [{:background => <RGB value>, :text => [[{:size => <size>, :color => 
  #                                                              <RGB value>}
  #                                             <text>, x, y]...]} ... ]
  
class Canvas < JPanel
  include java.awt.event.KeyListener
  
  attr_accessor :width, :height, :data

  def initialize (data, width=800, height=600)
    super(true)
    setSize(width, height)
    @slide_index = 0
    @data = data
    @current_slide = @data[0]
    @width = width
    @height = height
  end
  
  def translate_x pt
    ((pt.to_f / 100) * @width).to_i
  end

  def translate_y pt
    ((pt.to_f / 100) * @height).to_i
  end
  
  def paintComponent(g)
    super(g)
    
    #antialiasing
    g.setRenderingHint(java.awt.RenderingHints::KEY_ANTIALIASING,
                        java.awt.RenderingHints::VALUE_ANTIALIAS_ON)

    draw_background(g)
    draw_text(g)    
  end

  def draw_background (g)
    g.setColor(Color.new @current_slide[:background])
    g.fillRect(0, 0, @width, @height)
  end 

  def draw_text (g)
    strings = @current_slide[:text]
    strings.each do |text|
      map, string, x, y = text
      g.setColor(Color.new map[:color])
      g.setFont(Font.new("sansserif", Font::PLAIN, map[:size]))
      temp_y = y
      string.split("\n").each {|str|
        g.drawString(str, translate_x(x), translate_y(temp_y))
        temp_y += map[:size] / 6 #this is an approximation
      }
    end
  end

  def keyTyped(event);end

  def keyPressed(event)
    key = event.getKeyCode
    case key
      when java.awt.event.KeyEvent::VK_RIGHT: 
        @current_slide = @data[@slide_index + 1]
        unless @current_slide.nil?
          @slide_index += 1
          repaint
        end
        
      when java.awt.event.KeyEvent::VK_LEFT:
        unless @slide_index.zero?
          @slide_index -= 1
          @current_slide = @data[@slide_index]
          repaint
        end

      when java.awt.event.KeyEvent::VK_ESCAPE:
        java.lang.System.exit 0
    end
  end

  def keyReleased(event);end
end

