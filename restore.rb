# 
# After a fresh clone. For snamellit.
#

File.open('local.el', 'w') do |f|
  f.puts '(load "snamellit")'
end

puts "Don't forget to M-x byte-compile-file js2"
