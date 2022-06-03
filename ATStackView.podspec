Pod::Spec.new do |s|
s.name = 'ATStackView'
s.version = '1.0.0'
s.license = 'MIT'
s.summary = 'An Stack for iOS.'
s.homepage = 'https://github.com/AutoJiang/ATStackView'
s.license = { :type => 'MIT', :file => 'LICENSE' }
s.authors = { '姜傲腾' => '675917545@qq.com' }
s.source = { :git => 'https://github.com/AutoJiang/ATStackView.git', :tag => s.version.to_s }
s.requires_arc = true
s.ios.deployment_target = '11.0'
s.source_files = 'Sources/*.{h,m}'
end