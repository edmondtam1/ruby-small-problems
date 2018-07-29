# 1
arr = [
  "laboratory",
  "experiment",
  "Pans Labyrinth",
  "elaborate",
  "polar bear"
]

arr.each {|word| puts word if word =~ /lab/}

# 2

def execute(&block)
  block
end

execute { puts "Hello from inside the execute method!" }

# 4

def execute1(&block)
  block.call
end

execute1 { puts "Hello from inside the execute method!" }