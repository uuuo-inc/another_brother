#
# To learn more about a Podspec see http://guides.cocoapods.org/syntax/podspec.html.
# Run `pod lib lint another_brother.podspec` to validate before publishing.
#
Pod::Spec.new do |s|
  s.name             = 'another_brother'
  s.version          = '0.0.28'
  s.summary          = 'A new flutter plugin project.'
  s.description      = <<-DESC
A new flutter plugin project.
                       DESC
  s.homepage         = 'http://example.com'
  s.license          = { :file => '../LICENSE' }
  s.author           = { 'Your Company' => 'email@example.com' }
  s.source           = { :path => '.' }
  s.source_files = 'Classes/**/*'
  s.public_header_files = 'Classes/**/*.h'#, 'Classes/PtouchPrinterKit-Bridging-Header.h'

  
  #s.preserve_paths = 'Lib/BRLMPrinterKit.framework'
  #s.xcconfig = { 'OTHER_LDFLAGS' => '-framework BRLMPrinterKit.framework' }
  #s.ios.vendored_frameworks = 'Lib/BRLMPrinterKit.framework'
  #s.vendored_frameworks = 'BRLMPrinterKit.framework'
    
  #s.ios.vendored_frameworks = 'Lib/BRPtouchPrinterKit.framework'
  #s.vendored_frameworks = 'BRPtouchPrinterKit.framework'
  
#   s.dependency 'BRLMPrinterKit', '~> 4.5.2'

  s.ios.vendored_frameworks = 'Lib/BRLMPrinterKit.xcframework'

  # Removing RJ-GO libs because they seem to prevent publishing to Apple Store.
  #s.dependency 'BROTHERSDK'
  
  #s.dependency 'BRLMPrinterKitBind'
  
  s.dependency 'Flutter'
  s.platform = :ios, '9.0'

  # Flutter.framework does not contain a i386 slice.
  s.pod_target_xcconfig = { 'DEFINES_MODULE' => 'YES', 'EXCLUDED_ARCHS[sdk=iphonesimulator*]' => 'i386' }
  s.swift_version = '5.0'
  
  #s.subspec 'BRLMPrinterKit' do |br|
  #  br.source_files = 'Lib/BRLMPrinterKit.framework/**/*'
  #  br.public_header_files = 'Lib/BRLMPrinterKit.framework/**/*.h'
  #end
  
  #s.subspec 'BRLMPrinterKitBind' do |brBind|
  #  brBind.public_header_files = 'Classes/PtouchPrinterKit-Bridging-Header.h'
  #  brBind.dependency 'BRLMPrinterKit'
  #end

  
end
