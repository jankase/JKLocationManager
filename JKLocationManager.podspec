#
#  Be sure to run `pod spec lint UIRounding.podspec' to ensure this is a
#  valid spec and to remove all comments including this before submitting the spec.
#
#  To learn more about Podspec attributes see http://docs.cocoapods.org/specification.html
#  To see working Podspecs in the CocoaPods repo see https://github.com/CocoaPods/Specs/
#

Pod::Spec.new do |s|

  s.name         = "JKLocationManager"
  s.version      = "0.0.1"
  s.summary      = "Extended CLLocationManager with additional event + support multiple delegates"

  s.homepage     = "https://github.com/jankase/JKLocationManager"
  s.license      = { :type => "MIT", :file => "LICENSE" }

  s.author             = { "Jan Kase" => "jan.kase@me.com" }

  s.ios.deployment_target     = "11.0"

  s.source        = { :git => "https://github.com/jankase/JKLocationManager.git", :tag => "#{s.version}" }

  s.ios.source_files     = "JKLocationManager/*.swift"

  # s.public_header_files = "Classes/**/*.h"

  s.ios.frameworks     = "CoreLocation", "Foundation"

end
