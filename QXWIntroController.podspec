#
# Be sure to run `pod lib lint QXWIntroController.podspec' to ensure this is a
# valid spec before submitting.
#
# Any lines starting with a # are optional, but their use is encouraged
# To learn more about a Podspec see http://guides.cocoapods.org/syntax/podspec.html
#

Pod::Spec.new do |s|
  s.name             = 'QXWIntroController'
  s.version          = '0.0.1'
  s.summary          = '页面第一次打开的引导导航栏控制器'

# This description is used to generate tags and improve search results.
#   * Think: What does it do? Why did you write it? What is the focus?
#   * Try to keep it short, snappy and to the point.
#   * Write the description between the DESC delimiters below.
#   * Finally, don't worry about the indent, CocoaPods strips it!

  s.description      = <<-DESC
页面第一次打开的引导导航栏控制器，可以自定义view
                       DESC

  s.homepage         = 'https://github.com/wangqingxue/QXWIntroController'
  # s.screenshots     = 'www.example.com/screenshots_1', 'www.example.com/screenshots_2'
  s.license          = { :type => 'MIT', :file => 'LICENSE' }
  s.author           = { '173636717@qq.com' => '173636717@qq.com' }
  s.source           = { :git => 'https://github.com/wangqingxue/QXWIntroController.git', :tag => s.version.to_s }
  # s.social_media_url = 'https://twitter.com/<TWITTER_USERNAME>'

  s.ios.deployment_target = '8.0'

  s.source_files = 'QXWIntroController/Classes/**/*'
  
  # s.resource_bundles = {
  #   'QXWIntroController' => ['QXWIntroController/Assets/*.png']
  # }

  # s.public_header_files = 'Pod/Classes/**/*.h'
  # s.frameworks = 'UIKit', 'MapKit'
  # s.dependency 'AFNetworking', '~> 2.3'
end
