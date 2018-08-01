#
# Be sure to run `pod lib lint RBSImageGradientColor.podspec' to ensure this is a
# valid spec before submitting.
#
# Any lines starting with a # are optional, but their use is encouraged
# To learn more about a Podspec see https://guides.cocoapods.org/syntax/podspec.html
#

Pod::Spec.new do |s|
  s.name             = 'RBSImageGradientColor'
  s.version          = '0.1.0'
  s.summary          = 'Custom gradient color on imageView of RBSImageGradientColor.'

# This description is used to generate tags and improve search results.
#   * Think: What does it do? Why did you write it? What is the focus?
#   * Try to keep it short, snappy and to the point.
#   * Write the description between the DESC delimiters below.
#   * Finally, don't worry about the indent, CocoaPods strips it!

  s.description      = <<-DESC
Custom gradient color on imageView of RBSImageGradientColor.
That will supoort asynch.

                       DESC

  s.homepage         = 'https://github.com/rbbtsn0w/RBSImageGradientColor'
  # s.screenshots     = 'www.example.com/screenshots_1', 'www.example.com/screenshots_2'
  s.license          = { :type => 'MIT', :file => 'LICENSE' }
  s.author           = { 'rbbtsn0w' => 'hamiltonsnow@gmail.com' }
  s.source           = { :git => 'https://github.com/rbbtsn0w/RBSImageGradientColor.git', :tag => s.version.to_s }
  # s.social_media_url = 'https://twitter.com/rbbtsn0w'

  s.ios.deployment_target = '8.0'

  s.source_files = 'RBSImageGradientColor/Classes/**/*'

  # s.resource_bundles = {
  #   'RBSImageGradientColor' => ['RBSImageGradientColor/Assets/*.png']
  # }

  # s.public_header_files = 'Pod/Classes/**/*.h'
  # s.frameworks = 'UIKit', 'MapKit'
  # s.dependency 'AFNetworking', '~> 2.3'
end
