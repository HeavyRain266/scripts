# String colorizer
class String
  def red
    "\e[31m#{self}\e[0m"
  end

  def green
    "\e[32m#{self}\e[0m"
  end

  # TODO: Add more colors?
end

# Generate configurations
class Config
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
  @@ruby = <<~RB
  #{base}
  [*.rb]
  #{twospaces}
  [Gemfile]
  #{twospaces}
  [Rakefile]
  #{twospaces}
  RB

  @@lua = <<~LUA
  #{base}
  [*.lua]
  #{twospaces}
  LUA

  @@python = <<~PY
  #{base}
  [*.py]
  #{twospaces}
  [*.toml]
  #{twospaces}
  PY

  @@go = <<~GO
  #{base}
  [*.go]
  #{fourspaces}
  [Makefile]
  #{fourspaces}
  GO

  @@c = <<~C
  #{base}
  [*.{c,h}]
  #{fourspaces}
  [*.build]
  #{twospaces}
  [Makefile]
  #{fourspaces}
  C

  @@cpp = <<~CPP
  #{base}
  [*.{cpp,hpp}]
  #{fourspaces}
  [*.build]
  #{twospaces}
  [Makefile]
  #{fourspaces}
  CPP

  # combined
  @@web = <<~WEB
  #{base}
  [*.html]
  #{twospaces}
  [*.{css,scss}]
  #{twospaces}
  [*.{js,ts}]
  #{twospaces}
  WEB

  # TODO: Add more languages + setup variables for environments
  @@cfg = '.editorconfig'
  @@err = 'Error: file .editorconfig already exists and cannot be overwritten.'.red

  def self.lang_rb
    if File.exists?(@@cfg)
      puts(@@err)
    else File.write(@@cfg, @@ruby)
      puts 'Success: config for Ruby has been generated.'.green
    end
  end

  def self.lang_lua
    if File.exists?(@@cfg)
      puts(@@err)
    else File.write(@@cfg, @@lua)
      puts 'Success: config for Lua has been generated.'.green
    end
  end

  def self.lang_py
    if File.exists?(@@cfg)
      puts(@@err)
    else File.write(@@cfg, @@python)
      puts 'Success: config for Python has been generated.'.green
    end
  end

  def self.lang_go
    if File.exists?(@@cfg)
      puts(@@err)
    else File.write(@@cfg, go)
      puts 'Success: config for Go has been generated.'.red
    end
  end

  def self.lang_c
    if File.exists?(@@cfg)
      puts(@@err)
    else File.write(@@cfg, @@c)
      puts 'Success: config for C has been generated.'.green
    end
  end

  def self.lang_cpp
    if File.exists?(@@cfg)
      puts(@@err)
    else File.write(@@cfg, @@cpp)
      puts 'Success: config for C++ has been generated.'.green
    end
  end

  def self.env_web
    if File.exists?(@@cfg)
      puts(@@err)
    else File.write(@@cfg, @@web)
      puts 'Success: combined config for Web has been generated.'.green
    end
  end

end