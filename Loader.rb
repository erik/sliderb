require 'java'

JFileChooser = javax.swing.JFileChooser

class Loader
  def self.choose_and_read
    fc = JFileChooser.new
    if fc.showOpenDialog(nil) == JFileChooser::APPROVE_OPTION
      file = fc.getSelectedFile
      reader = java.io.BufferedReader.new java.io.FileReader.new file
      str = ""
      while (tmp = reader.readLine) != nil; str += tmp; end
      reader.close
      begin
        ret = eval(str)
        raise "WTF" unless ret.is_a? Array
        ret
        rescue Exception => e
          puts e
          nil
      end      
    else nil
    end
  end
end

