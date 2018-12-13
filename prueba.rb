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

def mean_elements(array)
  sum, mean = 0
  del = 0
  array.each do |i|
    sum += i.to_i
    del = del = if i == ' A' || i == 'A'
                  del + 1
                else
                  del + 0
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

    write_csv(h[:name][n], mean_elements(h[:mark][n]))
  end
  puts 'El archivo ya se ha generado'
end

def item2(name_str)
  h = readcsv_to_hash
  (0..h[:name].length - 1).each do |n|
    next unless h[:name][n] == name_str

    puts 'Número de inasistencias: '
    puts h[:mark][n].count 'A'
  end
end

def item3(name_str, approval)
  h = readcsv_to_hash
  (0..h[:name].length - 1).each do |n|
    next unless h[:name][n] == name_str

    if mean_elements(h[:mark][n]) >= approval.to_f
      puts "Congratulations, You've been approved"
    else
      puts 'Your marks are onsatisfactory'
    end
  end
end
puts 'Escribe tu nombre antes de empezar'
nombre = gets.chomp

loop do

  puts 'Opción 1: Descarga el promedio de notas obtenido'
  puts 'Opción 2: Muestra el total de inasistencias'
  puts 'Opción 3: Muestra el resultado de aprobación'
  puts 'Opción 4: Salida'
  select = gets.chomp
  if select == '1'
    item1(nombre)
  elsif select == '2'
    item2(nombre)
  elsif select == '3'
    puts 'Ingresa el promedio mínimo de aprobación :'
    mark = gets.chomp
    item3(nombre, mark)
  elsif select == '4'
    break
  else
    puts 'Esta no es una opción válida'

  end
end
