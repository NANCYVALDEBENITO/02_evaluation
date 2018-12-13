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
  sum, mean, del = 0
  del = 0
  array.each do |i|
    sum += i.to_i
    del = if i == ' A' ||i =='A'
            del = del +1
          else
            del = del +0
          end
  end
  mean = sum.to_f / (array.length - del)
  mean
end

def write_csv(name, mean)
  CSV.open(name + '.csv', 'w') do |csv|
    csv << %w[name mean]
    csv << [name, mean]
  end
end

def item1(name_str)
  h = readcsv_to_hash
  (0..h[:name].length - 1).each do |n|
    next unless h[:name][n] == name_str

    puts h[:name][n]
    puts mean_elements(h[:calification][n])
    write_csv(h[:name][n], mean_elements(h[:calification][n]))
  end
end

item1('David')
item1('Gonzalo')
item1('Mai')
item1('JP')

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
