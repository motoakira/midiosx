Gem::Specification.new do |s|
  s.name = "midiosx"
  s.version = "1.0.0"
  s.author = "SHINDO Motoaki"
  s.email = "motoakira@mac.com"
  s.homepage = "http://github.com/motoakira/midiosx"
  s.summary = s.description =
    "Ruby bindings for OS X's high-quality music sequencing/live-play API"
  # s.rubyforge_project = "midiosx"
  
  s.files = Dir.glob %w[
    README
    LICENSE
    Rakefile
    examples/**/*.rb
    ext/music_player/**/*.{c,h,rb}
    lib/**/*.rb
    midiosx.gemspec
    test/**/*.{mid,rb}
  ]
  s.extensions = ['ext/music_player/extconf.rb']
  s.platform = Gem::Platform::CURRENT
  s.require_paths = %w[ lib ext ]
  s.test_files = Dir.glob 'test/*_test.rb'
end
