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

def mean_elements(array)
  sum, mean = 0
  array.each do |i|
    sum += i.to_i
  end
  mean = sum.to_f / array.length
  return mean
end

def write_csv(name,mean)
	CSV.open(name+'.csv', 'w') do |csv|
		csv << ['name','mean']
		csv << [name,mean]
	end
end


def item1(name_str)
  h = readcsv_to_hash
  (0..h[:name].length - 1).each do |n|
    if h[:name][n] == name_str
      puts h[:name][n]
      puts mean_elements(h[:calification][n])
      write_csv(h[:name][n],mean_elements(h[:calification][n]))
     end
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
