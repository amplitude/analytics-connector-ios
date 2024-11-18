analytics_connector_version = "1.2.4" # Version is managed automatically by semantic-release, please dont change it manually

Pod::Spec.new do |spec|

  spec.name         = "AnalyticsConnector"
  spec.version      = analytics_connector_version 
  spec.summary      = "Connector library for seamless integration between Amplitude Analytics and Experiment SDKs"
  spec.license      = { :type => "MIT" }
  spec.author       = { "Amplitude" => "experiment@amplitude.com" }
  spec.homepage     = "https://amplitude.com"
  spec.source       = { :git => "https://github.com/amplitude/analytics-connector-ios.git", :tag => "v#{spec.version}" }

  spec.swift_version = '5.0'
  
  spec.ios.deployment_target  = '10.0'
  spec.ios.source_files       = 'Sources/AnalyticsConnector/**/*.{h,swift}'

  spec.osx.deployment_target  = '10.13'
  spec.osx.source_files       = 'sources/AnalyticsConnector/**/*.{h,swift}'

  spec.tvos.deployment_target = '9.0'
  spec.tvos.source_files      = 'sources/AnalyticsConnector/**/*.{h,swift}'
  
  spec.watchos.deployment_target = '3.0'
  spec.watchos.source_files      = 'sources/AnalyticsConnector/**/*.{h,swift}'

  spec.visionos.deployment_target = '1.0'
  spec.visionos.source_files      = 'sources/AnalyticsConnector/**/*.{h,swift}'

  spec.pod_target_xcconfig = { 'DEFINES_MODULE' => 'YES' }

end
