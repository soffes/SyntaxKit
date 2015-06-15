Pod::Spec.new do |spec|
  spec.name = 'SyntaxKit'
  spec.version = '0.1.0'
  spec.authors = {'Sam Soffes' => 'sam@soff.es'}
  spec.homepage = 'https://github.com/soffes/SyntaxKit'
  spec.summary = 'TextMate-style syntax highlighting.'
  spec.source = {:git => 'https://github.com/soffes/SyntaxKit.git', :tag => "v#{spec.version}"}
  spec.license = { :type => 'MIT', :file => 'LICENSE' }

  spec.ios.frameworks = 'Foundation', 'UIKit'
  spec.osx.frameworks = 'Foundation', 'AppKit'
  spec.source_files = 'SyntaxKit/*.{h,m,swift}'
end
