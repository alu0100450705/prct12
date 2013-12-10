class MatrixDSL 
require "./matriz.rb" #definicion de la clase matriz

  attr_accessor :op, :name, :modo, :tipo_op
  
  def initialize(name,&block)
    self.name=name            #Nombre de la instancia MatrixDSL
    self.op=[]              #Array de operandos de tipo matriz
    self.modo = ""          #Modo consola o modo fichero
    
    instance_eval &block    #devuelve el bloque que se le pasa
    
  end
  
  def to_s
     if modo == "console" 
        puts name
        self.tipo_op = { "Suma" => op[0]+op[1], "Resta" => op[0]-op[1], "Multiplicacion" => op[0]*op[1]}
        puts tipo_op[name]
     elsif modo == "file"
        puts "pasar a un fichero"
     end
  end  
  
  def option(mod)
     self.modo << mod
  end
  
  def operand(arrays)
		m= Matriz.new(arrays)
     self.op << m
  end    
  
end

ejemplo = MatrixDSL.new("Multiplicacion") do 
  option "console"
	

  operand [[1,2,3],[4,5,6],[7,8,9]]  
  operand [[1,1,1],[1,1,1],[1,1,1]]  
   

end

puts ejemplo
