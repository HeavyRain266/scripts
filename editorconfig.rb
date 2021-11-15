#!/usr/bin/env ruby

require 'optionparser'

help = <<~HELP
Generator for Editorconfig

OPTIONS:
-h,   --help      Prints this message

-r,   --ruby      Generate config for Ruby
-l,   --lua       Generate config for Lua
-p,   --python    Generate config for Python
-g,   --golang    Generate config for Go
-c,   --clang     Generate config for C
-cpp, --cplusplus Generate config for C++
-w,   --web       Generate as combined for html, css, scss, js & ts

USAGE:
$ ./editorconfig.rb [option]
HELP

# Shared
base = <<~BASE
root = true

[*]
charset = utf-8
indent_size = 4
indent_style = space
end_of_line = lf
insert_final_newline = true
trim_trailing_whitespace = true
BASE

twospaces = <<~TWOSPACES
indent_size = 2
indent_style = space
TWOSPACES

fourspaces = <<~FOURSPACES
indent_size = 4
indent_style = space
FOURSPACES

# Per language
ruby = <<~RB
#{base}
[*.rb]
#{twospaces}
[Gemfile]
#{twospaces}
[Rakefile]
#{twospaces}
RB

lua = <<~LUA
#{base}
[*.lua]
#{twospaces}
LUA

python = <<~PY
#{base}
[*.py]
#{twospaces}
[*.toml]
#{twospaces}
PY

go = <<~GO
#{base}
[*.go]
#{fourspaces}
[Makefile]
#{fourspaces}
GO

c = <<~C
#{base}
[*.{c,h}]
#{fourspaces}
[*.build]
#{twospaces}
[Makefile]
#{fourspaces}
C

cpp = <<~CPP
#{base}
[*.{cpp,hpp}]
#{fourspaces}
[*.build]
#{twospaces}
[Makefile]
#{fourspaces}
CPP

# combined
web = <<~WEB
#{base}
[*.html]
#{twospaces}
[*.{css,scss}]
#{twospaces}
[*.{js,ts}]
#{twospaces}
WEB

# String colorizer
class String
  def red
    "\e[31m#{self}\e[0m"
  end

  def green
    "\e[32m#{self}\e[0m"
  end
end


OptionParser.new do |opts|
  err = 'Error: file .editorconfig already exists and cannot be overwritten.'.red
  file = '.editorconfig'

  opts.on('-h', '--help') do
    puts(help)
  end
  opts.on('-v', '--version') do
    puts 'v0.1'
  end

  opts.on('-r', '--ruby') do
    if File.exists?(file)
      puts(err)
    else File.write(file, ruby)
      puts 'Success: config for Ruby has been generated.'.green
    end
  end

  opts.on('-l', '--lua') do
    if File.exists?(file)
      puts(err)
    else File.write(file, lua)
      puts 'Success: config for Lua has been generated.'.green
    end
  end

  opts.on('-p', '--python') do
    if File.exists?(file)
      puts(err)
    else File.write(file, python)
      puts 'Success: config for Python has been generated.'.green
    end
  end

  opts.on('-g', '--golang') do
    if File.exists?(file)
      puts(err)
    else File.write(file, go)
      puts 'Success: config for Go has been generated.'.red
    end
  end

  opts.on('-c', '--clang') do
    if File.exists?(file)
      puts(err)
    else File.write(file, c)
      puts 'Success: config for C has been generated.'.green
    end
  end

  opts.on('-cpp', '--cplusplus') do
    if File.exists?(file)
      puts(err)
    else File.write(file, cpp)
      puts 'Success: config for C++ has been generated.'.green
    end
  end

  opts.on('-w', '--web') do
    if File.exists?(file)
      puts(err)
    else File.write(file, web)
      puts 'Success: combined config for Web has been generated.'.green
    end
  end

end.parse!
