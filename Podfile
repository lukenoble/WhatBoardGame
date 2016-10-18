# Uncomment this line to define a global platform for your project
# platform :ios, '9.0'

target 'WhatBoardGame' do
  # Comment this line if you're not using Swift and don't want to use dynamic frameworks
  use_frameworks!

  # Pods for WhatBoardGame
  
  pod 'Alamofire' , '~> 4.0'
  pod 'SwiftyJSON' , :git => 'https://github.com/appsailor/SwiftyJSON.git', :branch => 'swift3'
  pod 'Crashlytics', '~> 3.8'
  pod 'Fabric', '~> 1.6'
  end
  post_install do |installer|
      installer.pods_project.targets.each do |target|
          target.build_configurations.each do |config|
              config.build_settings['SWIFT_VERSION'] = '3.0'
         
      end
  end
end
