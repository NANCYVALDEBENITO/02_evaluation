def item1
	
end

def item2

end
def item2

end
def item2

end
def item2

end

loop do
	puts 'Ingrese una opción'
	puts '1 Conocer la cantidad de productos existentes'
	puts '2 Ingresar el nombre de un producto y buscar el stock'
	puts '3 Conocer los productos registrados en bodega'
	puts '4 Conocer los productos con existencia total menor a un valor'
	puts '5 Registra un nuevo producto con el stock'
	puts '6 Salir'
	select = gets.chomp

	if select == '1'
		item1
	elsif select == '2'
		puts ''
	elsif select == '3'
		puts 'Los productos disponibles son :' 
		item3
	elsif select == '4'
		puts ''
	elsif select == '5'
		item5
	elsif select == '6'
		break
	else
		puts 'Esta no es una opción válida'
		
	end
end
