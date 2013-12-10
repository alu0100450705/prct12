class MatrixDSL 
require "./matriz.rb" #definicion de la clase matriz

  attr_accessor :op, :name, :modo, :tipo_op
  
  def initialize(name,&block)
    self.name=name            #Nombre de la instancia MatrixDSL
    self.op=[]              #Array de operandos de tipo matriz
    self.modo = []          #Modo consola o modo fichero
#     self.tipo_op=Hash.new(0)
    self.tipo_op={}
    @i = 0;
    instance_eval &block    #devuelve el bloque que se le pasa
  end
  
  def to_s
     self.tipo_op = { "Suma" => op[0]+op[1], "Resta" => op[0]-op[1], "Multiplicacion" => op[0]*op[1]}
#      puts "antes de imprimir suma"
#      puts tipo_op[name].to_s     AQUI SI LO MUESTRA BIEN .No sabe poner un objeto Matriz en el fichero.
     if modo[0] == "console" 
        puts name
        puts tipo_op[name]
     else
       begin
	 # something which might raise an exception
	 puts "Creando fichero"
	   i=0
           f= File.open('matriz.txt', 'w') 
           f.puts name
	   f.puts tipo_op[name]
#            f.puts "#{tipo_op[name]}"  # AQUI PIERDE EL VALOR,a lo mejor hay q sobrecargar el to_s de hash para que lo muestre como una matriz.
# 	      f2.close
       rescue 
          # code that deals with some exception
          # code that deals with some other exception
	  puts "rescatando"
       else
          # code that runs only if *no* exception was raised
	  puts "sin excepciones"
       ensure
          # ensure that this code always runs, no matter what
	 f.close unless f.nil?
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
