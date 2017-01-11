Pod::Spec.new do |s|
  s.name         = 'XXPickerView'
  s.summary      = 'ActionSheet with UIPickerView.'
  s.version      = '1.0.0'
  s.license      = { :type => 'MIT', :file => 'LICENSE' }
  s.authors      = { 'jeikerxiao' => 'jeiker@126.com' }
  s.homepage     = 'https://github.com/jeikerxiao/XXPickerView'

  s.ios.deployment_target = '7.0'

  s.source       = { :git => 'https://github.com/jeikerxiao/XXPickerView.git', :tag => s.version.to_s }
  
  s.requires_arc = true
  s.source_files = 'XXPickerView/*.{h,m}'
  s.public_header_files = 'XXPickerView/*.{h}'
  
  s.frameworks = 'Foundation', 'CoreFoundation', 'UIKit', 'QuartzCore'

end
