def readcsv_to_hash
  # import requires for opening a csv file
  require 'csv'
  # create array and hash for operating
  data_hash = {}
  names = []
  califications = []
  # open csv for reading data
  CSV.foreach('file.csv') do |row|
    names.push(row.shift)
    califications.push(row)
  end
  # append array to hash
  data_hash[:name] = names
  data_hash[:calification] = califications
  data_hash
end

def item1(name_str)
  h = readcsv_to_hash
  puts h[:name].length
  (0..h[:name].length - 1).each do |n|
    puts h[:name][n] if h[:name][n] == name_str
  end
end

item1('David')

def item2
  puts ''
end

def item3
  puts ''
end

def item4
  puts ''
end

# loop do

#   if select == '1'
#     item1
#   elsif select == '2'
#     item2
#   elsif select == '3'
#     puts 'Los productos disponibles son :'
#     item3
#   elsif select == '4'
#     puts ''
#   elsif select == 'exit'
#     break
#   else
#     puts 'Esta no es una opción válida'

#   end
# end
