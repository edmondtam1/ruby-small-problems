# my_proc = proc { |thing| puts "This is a #{thing}." }
# puts my_proc
# puts my_proc.class
# my_proc.call
# my_proc.call('cat')
# my_proc.call(7)

# # initialising the proc object with proc { }
# # calls to_s on puts
# # takes the argument when the call method is called

# my_lambda = lambda { |thing| puts "This is a #{thing}." }
# my_second_lambda = -> (thing) { puts "This is a #{thing}." }
# puts my_lambda
# puts my_second_lambda
# puts my_lambda.class
# my_lambda.call('dog')
# my_lambda.call
# my_third_lambda = Lambda.new { |thing| puts "This is a #{thing}." }

# new lambda created with ->
# cannot create lambda object with Lambda.new
# nothing printed for my_lambda.call - error printed
# lambda object is a proc but maintains a separate identity through (lambda)
# it requires a set number of arguments, otherwise error is thrown

# def block_method_1(animal)
#   yield
# end

# block_method_1('seal') { |seal| puts "This is a #{seal}."}
# block_method_1('seal') { |test| puts test }

# method takes block and argument and yields to block
# block doesn't take argument because no argument passed to yield
# error thrown if no block is passed when yield is used

# def block_method_2(animal)
#   yield(animal)
# end

# block_method_2('turtle') { |turtle| puts "This is a #{turtle}."}
# block_method_2('turtle') do |turtle, seal|
#   puts "This is a #{turtle} and a #{seal}."
# end
# block_method_2('turtle') { puts "This is a #{animal}."}

# too few arguments leads remaining ones to be passed a nil
# throws an error if variable is referenced that isn't in block's scope

# comparison: lambdas are a type of Proc object
# an implicit block is a grouping of code or a closure, but is not an Object
# lambdas enforce the number of arguments passed, but blocks and Procs do not



