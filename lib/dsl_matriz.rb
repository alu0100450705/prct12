class MatrixDSL 
require "./matriz.rb" #definicion de la clase matriz

  attr_accessor :op, :name, :modo
  
  def initialize(name,&block)
    self.name=name            #Nombre de la instancia MatrixDSL
    self.op=[]              #Array de operandos de tipo matriz
    self.modo = ""          #Modo consola o modo fichero
    instance_eval &block    #devuelve el bloque que se le pasa
  end
  
  def to_s
     if modo == "console" 
        console = name
        console << " = " 
        console << "#{op[0]+op[1]}"
        console
     elsif modo == "file"
        puts "pasar a un fichero"
     end
  end  
  
  def option(mod)
     self.modo << mod
  end
  
  def operand(arrays)
     self.op << arrays
  end    
  
end

ejemplo = MatrixDSL.new("Suma") do 
   option "console"
#    puts self.name
   m1= Matriz.new([[1,2,3],[1,2,3],[4,5,6]])
#    puts mdis1
   m2= Matriz.new([[9,8,7],[6,5,4],[3,2,1]])
   
   operand(m1)  
# #    puts self.op[0]
   operand(m2) 
end

# mdis1= MatrizDispersa.new([[0,0,0],[1,2,3],[0,0,0]])
# mdis2= MatrizDispersa.new([[0,0,0],[1,2,3],[0,0,0]])
# # # puts mdis1
# # # puts mdis2
# mdis3=mdis1+mdis2
# puts mdis3
# mde1= MatrizDensa.new([[1,2,3],[1,2,3],[4,5,0]])
# puts mde1
puts ejemplo
