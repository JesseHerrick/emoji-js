Gem::Specification.new do |s|
  s.name        = 'emoji-js'
  s.version     = '0.3.0'
  s.licenses    = ['MIT']
  s.summary     = "Emojify your website like GitHub and Campfire! :thumbsup:"
  s.description = s.summary
  s.authors     = ["Jesse Herrick"]
  s.email       = 'jessegrantherrick@gmail.com'
  s.files       = `git ls-files`.split
  s.executables << 'emoji-js'
  s.homepage    = 'https://github.com/JesseHerrick/emoji-js'

  s.add_runtime_dependency 'coffee-script'
  s.add_runtime_dependency 'colorize'
  s.add_runtime_dependency 'uglifier'

  s.add_development_dependency 'bundler'
  s.add_development_dependency 'rake'
end
