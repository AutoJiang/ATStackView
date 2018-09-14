Pod::Spec.new do |s|
s.name = 'ATStackView'
s.version = '0.0.1'
s.license = 'MIT'
s.summary = 'An Stack for iOS.'
s.homepage = 'https://github.com/AutoJiang/ATStackView'
s.authors = { '姜傲腾' => '675917545@qq.com' }
s.source = { :git => 'https://github.com/AutoJiang/ATStackView.git', :tag => s.version.to_s }
s.requires_arc = true
s.ios.deployment_target = '11.0'
s.source_files = 'Sources/*.{h,m}'
s.resources = 'Sources/images/*.{png,xib}'
end