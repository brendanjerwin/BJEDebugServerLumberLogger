Pod::Spec.new do |s|
  s.name        = 'BJEDebugServerLumberLogger'
  s.version     = '1.0'
  s.summary     = 'View your debug logs in iTerm or Terminal.app and get out of that noisy, hard-to-read, xcode console.'
  s.authors     = { 'Brendan Erwin' => 'brendanjerwin@gmail.com' }
  s.homepage    = 'https://github.com/romaonthego/REDebugClient'
  s.source      = { :git => 'https://github.com/brendanjerwin/BJEDebugServerLumberLogger.git',
                    :tag => '1.0' }
  s.license     = { :type => "MIT", :file => "LICENSE" }

  # Platform setup
  s.requires_arc = true
  s.ios.deployment_target = '4.3'
  s.osx.deployment_target = '10.7'

  s.source_files = 'BJEDebugServerLumberLogger/Logger/*'
  s.public_header_files = 'BJEDebugServerLumberLogger/Logger/*.h'

  s.dependency 'CocoaAsyncSocket', '~> 0.0.1'
  s.dependency 'CocoaLumberjack', '~> 1.6.0'
end
