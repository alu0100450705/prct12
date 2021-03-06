# == Construcción de una gema.
#  -> Diseñar y desarrollar un DSL interno para trabajar con matrices. 
#
# ===Clase MatrixDSL
#   Es la clase que utiliza el DSL. Esta clase tiene los siguientes métodos:
#      initialize: Inicialización de os atributos de la clase.
#      to_s: método que depende del método elegido muestra por consola o escribe en un fichero el resultado de aplicar la operación dada como nombre.     
#      operand(arrays): Almacenamos en un vector de operandos las matrices. Estas pueden ser densas o dispersas
#
#
class MatrixDSL 
require "./matriz.rb" #definicion de la clase matriz

  attr_accessor :op, :name, :modo, :tipo_op
  
  def initialize(name,&block)
    self.name=name            #Nombre de la instancia MatrixDSL
    self.op=[]              #Array de operandos de tipo matriz
    self.modo = []          #Modo consola o modo fichero
    self.tipo_op={}
    @i = 0;
    instance_eval &block    #devuelve el bloque que se le pasa
  end
  
  def to_s
		 
	 resul = case name
   when "Suma" then op[0]+op[1]
   when "Resta" then op[0]-op[1]
   when "Multiplicacion" then op[0]*op[1]
   end
		
     if modo[0] == "console" 
        puts name
        puts resul
     else
			 puts "Creando fichero..."
			 i=0
			 f= File.open('matriz.txt', 'w') 
			 f.puts name
			 f.puts resul
			 puts "fichero terminado"
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
  option "console"
  option "Diespersa"

  operand [[0,0,0],[0,5,6],[0,0,0]]  
  operand [[0,0,0],[1,1,1],[0,0,0]]  
   

end

puts ejemplo
