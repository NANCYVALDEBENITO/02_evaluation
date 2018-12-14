def readcsv_to_hash
  # import requires for opening a csv file
  require 'csv'
  # create array and hash for operating
  data_hash = {}
  names = []
  marks = []
  # open csv for reading data
  CSV.foreach('file.csv') do |row|
    names.push(row.shift)
    marks.push(row)
  end
  # append array to hash
  data_hash[:name] = names
  data_hash[:mark] = marks
  data_hash
end

def average_elements(array)
  sum, average = 0
  del = 0
  array.each do |i|
    sum += i.to_i
    del = del = if i == ' A' || i == 'A'
                  del + 1
                else
                  del + 0
                end
  end
  average = sum.to_f / (array.length - del)
  average
end

def write_csv(name, average)
  CSV.open(name + '.csv', 'w') do |csv|
    csv << %w[name average]
    csv << [name, average]
  end
end

def item1
  h = readcsv_to_hash
  (0..h[:name].length - 1).each do |n|
    # next unless h[:name][n] == name_str

    write_csv(h[:name][n], average_elements(h[:mark][n]))
  end
  puts 'The files has been generated!'
end

def item2
  h = readcsv_to_hash
  (0..h[:name].length - 1).each do |n|
    # next unless h[:name][n] == name_str

    puts "#{h[:name][n]}: total of absences #{h[:mark][n].count 'A'}"
  end
end

def item3(approval)
  h = readcsv_to_hash
  (0..h[:name].length - 1).each do |n|
    # next unless h[:name][n] == name_str

    if average_elements(h[:mark][n]) >= approval.to_f
      puts "#{h[:name][n]}: aproved with average #{average_elements(h[:mark][n])}"
    else
      puts "#{h[:name][n]}: didn't aprove with average #{average_elements(h[:mark][n])}"
    end
  end
end

loop do
  puts ''
  puts 'Opción 1: Descarga el promedio de notas obtenido'
  puts 'Opción 2: Muestra el total de inasistencias'
  puts 'Opción 3: Muestra el resultado de aprobación'
  puts 'Opción 4: Salida'
  puts ''
  select = gets.chomp
  puts ''
  if select == '1'
    item1
  elsif select == '2'
    item2
  elsif select == '3'
    puts 'Ingresa el promedio mínimo de aprobación :'
    mark = gets.chomp
    item3(mark)
  elsif select == '4'
    break
  else
    puts 'Esta no es una opción válida'

  end
end
