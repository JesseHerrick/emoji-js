Gem::Specification.new do |s|
  s.name        = 'emoji-js'
  s.version     = '0.1.0'
  s.licenses    = ['MIT']
  s.summary     = "Emojify your website like GitHub and Campfire! :thumbsup:"
  s.description = s.summary
  s.authors     = ["Jesse Herrick"]
  s.email       = 'jessegrantherrick@gmail.com'
  s.files       = `git ls-files`.split
  s.executables << 'bin/emoji-js'
  s.require_paths << ["lib", "vendor"]
  s.homepage    = 'https://github.com/JesseHerrick/emoji-js'
end