class MatrixDSL 
require "./matriz.rb" #definicion de la clase matriz

  attr_accessor :op, :act, :modo
  
  def initialize(act,&block)
    self.act=act
    self.op=[]
  end
    
  def option(mod)
    self.modo << mod
  end
  
  def operand(arrays)
		puts "estamos aqui"
    self.op << Matriz.vector(arrays)
  end    
  
end

ejemplo = MatrixDSL.new("Suma") do 
 option "console"
 
 operand [[1,2,3],[4,5,6],[7,8,9]]  
 operand [[1,1,1],[1,1,1],[1,1,1]]  
  
end

puts ejemplo
