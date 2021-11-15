#!/usr/bin/env ruby

require 'optionparser'

require_relative 'config.rb'


class Options
  OptionParser.new do |opts|

    # Initialize config class
    Config::new

    help = <<~HELP
    Generator for Editorconfig

    OPTIONS:
    -h,   --help      Prints this message
    -v,   --version   Prints script version

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

    opts.on('-h', '--help') do
      puts(help)
    end

    opts.on('-v', '--version') do
      puts 'v0.2'
    end

    opts.on('-r', '--ruby') do
      Config::lang_rb
    end

    opts.on('-l', '--lua') do
      Config::lang_lua
    end

    opts.on('-p', '--python') do
      Config::lang_py
    end

    opts.on('-g', '--golang') do
      Config::lang_go
    end

    opts.on('-c', '--clang') do
      Config::lang_c
    end

    opts.on('-cpp', '--cplusplus') do
      Config::lang_cpp
    end

    opts.on('-w', '--web') do
      Config::env_web
    end

  end.parse!
end

Options.new
