target 'AffirmationCards' do
use_frameworks!

# Firebase
pod 'Firebase/Core'
pod 'Firebase/Auth'
pod 'Firebase/Database'
pod 'Firebase/Storage'

# XML Parser
# pod 'SWXMLHash'

# IQKeyboardManager
pod 'IQKeyboardManagerSwift'

# SnapKit
pod 'SnapKit', '~> 3.0'
end

post_install do |installer|
installer.pods_project.targets.each do |target|
target.build_configurations.each do |config|
config.build_settings['SWIFT_VERSION'] = '3.0'
config.build_settings['ALWAYS_EMBED_SWIFT_STANDARD_LIBRARIES'] = 'NO'
end
end
end
