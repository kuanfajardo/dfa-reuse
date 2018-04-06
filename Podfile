# Uncomment the next line to define a global platform for your project
# platform :ios, '9.0'

source 'https://github.com/CocoaPods/Specs.git'

target 'Reuse' do
  # Comment the next line if you're not using Swift and don't want to use dynamic frameworks
  use_frameworks!

  # Pods for Reuse
  pod 'ChameleonFramework/Swift', :git => 'https://github.com/ViccAlexander/Chameleon.git'
  pod 'EZSwiftExtensions' 		# NO SWIFT 4 SUPPORT!
  pod 'Material', '~> 2.0'
  pod 'SnapKit', '~> 4.0.0'
  pod 'AIFlatSwitch', '~> 1.0.1'
  pod 'Eureka'

  pod 'Firebase/Core'
  pod 'Firebase/Auth'
  pod 'Firebase/Firestore'
  pod 'Firebase/Messaging'
  pod 'Firebase/Storage'

  pod 'FirebaseUI/Auth'
  pod 'FirebaseUI/Facebook'
  pod 'FirebaseUI/Firestore'

  pod 'FBSDKLoginKit'

  pod 'SwiftyJSON'
end

post_install do |installer|
    legacy_pods = ['EZSwiftExtensions', 'Material']

    for pod in legacy_pods do
        installer.pods_project.targets.each do |target|
            if target.name == pod
                target.build_configurations.each do |config|
                    config.build_settings['SWIFT_VERSION'] = '3.2'
                end
            end
        end
    end
end

