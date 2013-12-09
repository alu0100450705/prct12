class MatrixDSL 
require "./matriz.rb" #definicion de la clase matriz

  attr_accessor :op, :act, :modo
  
  def initialize(act,&block)
    self.act=act            #Nombre de la instancia MatrixDSL
    self.op=[]              #Array de operandos de tipo matriz
    self.modo = ""          #Modo consola o modo fichero
    instance_eval &block    #devuelve el bloque que se le pasa
  end
  
  def to_s
     if modo == "console" 
        console = act
        console << " = " 
        console << (op[0]+op[1])
        console
     elsif modo == "file"
        puts "pasar a un fichero"
     end
  end  
  
  def option(mod)
     self.modo << mod
  end
  
  def operand(arrays)
     self.op << Matriz.new(arrays)
  end    
  
end

ejemplo = MatrixDSL.new("Suma") do 
   option "console"
   puts self.act
   operand [[1,2,3],[4,5,6],[7,8,9]]  
   operand [[1,1,1],[1,1,1],[1,1,1]]  
end

puts ejemplo
