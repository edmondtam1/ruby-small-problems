def say(words)
  yield if block_given?
  puts "> " + words
  yield if block_given?
end

say("hi there") do
  system 'clear'
end
