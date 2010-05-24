%w{java Canvas Loader}.each {|f| require f}

data = Loader.choose_and_read

if data.nil?
  javax.swing.JOptionPane.showMessageDialog nil, "WTF ARE YOU DOING?"
  java.lang.System.exit 2
end

canvas = Canvas.new(data, 800, 800)

frame = javax.swing.JFrame.new("SlideRB")
frame.setDefaultCloseOperation(javax.swing.JFrame::EXIT_ON_CLOSE)
frame.addKeyListener canvas
frame.setSize 800, 800
frame.setResizable false
frame.add canvas
frame.setVisible true