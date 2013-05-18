Pod::Spec.new do |s|
  s.name        = 'BJEDebugServerLumberLogger'
  s.version     = '1.0'
  s.summary     = ''
  s.authors     = { 'Brendan Erwin' => 'brendanjerwin@gmail.com' }
  s.homepage    = 'https://github.com/romaonthego/REDebugClient'
  s.source      = { :git => 'https://github.com/brendanjerwin/BJEDebugServerLumberLogger.git',
                    :tag => '1.0' }
  s.license     = { :type => "MIT", :file => "LICENSE" }

  # Platform setup
  s.requires_arc = true
  s.ios.deployment_target = '4.3'
  s.osx.deployment_target = '10.7'

  s.source_files = ''
  s.public_header_files = '/*.h'

  s.dependency 'CocoaAsyncSocket', '~> 0.0.1'
end
