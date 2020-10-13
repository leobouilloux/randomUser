source 'https://github.com/CocoaPods/Specs.git'
platform :ios, '14.0'
use_frameworks!
inhibit_all_warnings!

def pods
    pod 'Alamofire'
    pod 'RealmSwift'
    pod 'RxCocoa'
    pod 'RxSwift'
end

target 'RandomUser' do
    pods
end

target 'RandomUserTests' do 
    pods
end


post_install do |installer|
    installer.pods_project.targets.each do |target|
        target.build_configurations.each do |config|
            config.build_settings['EXCLUDED_ARCHS[sdk=iphonesimulator*]'] = 'arm64'
            config.build_settings['EXCLUDED_ARCHS[sdk=watchsimulator*]'] = 'arm64'
            config.build_settings['EXCLUDED_ARCHS[sdk=appletvsimulator*]'] = 'arm64'
   
        end
    end
end