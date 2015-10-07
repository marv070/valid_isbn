# def make_file
#   fname = ""
#   somefile = File.open(fname, "w")
#   somefile.puts "Hello file!"
#   somefile.close
# end

#make_file

def read_write
  file = File.open("input_isbn_file.csv", "r")
  contents = file.read
# i can choose to print it to the screen or just the file, not sure which
#puts contents
  filename = "isbn_output.csv"
  somefile = File.open(filename, "w")
  somefile.puts contents
  somefile.close

end

read_write