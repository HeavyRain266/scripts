require 'tty-tree'

puts TTY::Tree.new(Dir.pwd).render
