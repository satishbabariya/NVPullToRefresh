Pod::Spec.new do |s|
  s.name             = 'NVPullToRefresh'
  s.version          = '0.0.1'
  s.summary          = 'NVActivityIndicatorView + PullToRefresh'

  s.description      = <<-DESC
  
  This component implements pure pull-to-refresh logic with NVActivityIndicatorView animations.
  
                       DESC

  s.homepage         = 'https://github.com/satishbabariya/NVPullToRefresh'
  s.license          = { :type => 'MIT', :file => 'LICENSE' }
  s.author           = { 'Satish Babariya' => 'satish.babariya@gmail.com' }
  s.source           = { :git => 'https://github.com/satishbabariya/NVPullToRefresh.git', :tag => s.version }
  
  s.ios.deployment_target = '11.0'

  s.source_files = 'NVPullToRefresh/Classes/**/*.swift'
  
  s.swift_version = '4.2'

  s.frameworks = 'UIKit'
  s.dependency "PullToRefresher", "~> 3.1"
  s.dependency "NVActivityIndicatorView", "~> 4.7"
end
