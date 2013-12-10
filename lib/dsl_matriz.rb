class MatrixDSL 
require "./matriz.rb" #definicion de la clase matriz

  attr_accessor :op, :name, :modo, :tipo_op
  
  def initialize(name,&block)
    self.name=name            #Nombre de la instancia MatrixDSL
    self.op=[]              #Array de operandos de tipo matriz
    self.modo = []          #Modo consola o modo fichero
    @i = 0;
    instance_eval &block    #devuelve el bloque que se le pasa
  end
  
  def to_s
			self.tipo_op = { "Suma" => op[0]+op[1], "Resta" => op[0]-op[1], "Multiplicacion" => op[0]*op[1]}
     if modo[0] == "console" 
        puts name
        puts tipo_op[name]
     else
				puts "Creando fichero"
        File.open('matriz.txt', 'w') do |f2|
					f2.puts name
					f2.puts tipo_op[name]
				end
     end
  end  
  
  def option(mod)
     self.modo[@i]= mod
      @i += 1
  end
  
  def operand(arrays)
		if modo[1] == "Densa" 
			m= Matriz.new(arrays)
		else
			m= MatrizDispersa.new(arrays)
		end
     self.op << m
  end    
  
end

ejemplo = MatrixDSL.new("Suma") do 
  option "file"
  option "Dispersa"
	

  operand [[0,0,0],[4,5,6],[0,0,0]]  
  operand [[0,0,0],[1,1,1],[0,0,0]]  
   

end

puts ejemplo
