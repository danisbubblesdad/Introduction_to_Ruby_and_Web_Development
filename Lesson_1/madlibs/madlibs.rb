dictionary = {
  nouns: ['dog', 'car', 'clown', 'hat'],
  verbs: ['juggl', 'spinn', 'poop'],
  adjectives: ['giant', 'red']
}

def say(msg)
  puts("=> #{msg}")
end

def exit_with(msg)
  say(msg)
  exit
end

exit_with("No input file!") if ARGV.empty?
exit_with("Input file doesn't exist!") if !File.exists?(ARGV[0])

contents = File.open(ARGV[0], 'r') do |f|
  f.read
end

contents.gsub!('NOUN').each do
  dictionary[:nouns].sample
end

contents.gsub!('VERB').each do
  dictionary[:verbs].sample
end

contents.gsub!('ADJECTIVE').each do
  dictionary[:adjectives].sample
end

p contents
