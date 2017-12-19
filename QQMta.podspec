Pod::Spec.new do |s|

  s.name                  = 'QQMta'
  s.version               = '2.1.1'
  s.summary               = '"腾讯移动分析（MTA）'
  s.homepage              = 'http://mta.qq.com'
  s.authors               = { 'derekibw' => 'https://github.com/derekibw' }
  s.source                = { :git => 'https://github.com/derekibw/QQMta.git', :tag => s.version }
  s.license               = 'None'
  s.requires_arc          = true
  s.ios.deployment_target = '6.0'
  s.platform              = :ios
  s.default_subspecs      = 'Core'

  s.subspec 'Core' do |ss|
    ss.source_files         = 'SDK/*.h'
    ss.public_header_files  = 'SDK/*.h'
    ss.vendored_library     = 'SDK/libmtasdk.a'
    ss.frameworks           = 'CoreTelephony', 'CFNetwork', 'Security', 'SystemConfiguration'
    ss.libraries            = 'z', 'sqlite3'
  end

  s.subspec 'AutoTrack' do |ss|
    ss.dependency         'QQMta/Core'
    ss.vendored_library = 'SDK/plugin/autotrack/libautotrack.a'
  end

  s.subspec 'IDFA' do |ss|
    ss.dependency         'QQMta/Core'
    ss.vendored_library = 'SDK/plugin/idfa/libidfa.a'
    ss.frameworks       = 'AdSupport'
  end

  s.subspec 'InstallTracker' do |ss|
    ss.dependency             'QQMta/Core'
    ss.source_files         = 'SDK/plugin/installtracker/*.h'
    ss.public_header_files  = 'SDK/plugin/installtracker/*.h'
    ss.vendored_library     = 'SDK/plugin/installtracker/libinstalltracker.a'
  end

  spec.subspec 'Hybrid' do |ss|
    ss.dependency       'QQMta/BasicAnalysis'
    ss.vendored_libraries   = "SDK/plugin/hybrid/*.a"
    ss.source_files       = "SDK/plugin/hybrid/*.h"
    ss.public_header_files    = "SDK/plugin/hybrid/*.h"
  end

end
