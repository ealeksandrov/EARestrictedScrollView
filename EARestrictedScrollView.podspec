Pod::Spec.new do |s|

  s.name         = 'EARestrictedScrollView'
  s.version      = '2.1.0'
  s.swift_version = '5.0'
  s.summary      = 'UIScrollView sublass with ability to restrict or limit scrolling area.'
  s.screenshot   = 'https://raw.githubusercontent.com/ealeksandrov/EARestrictedScrollView/master/Screenshots/Screenshot01.png'
  s.homepage     = 'https://github.com/ealeksandrov/EARestrictedScrollView'
  s.license      = { :type => 'MIT', :file => 'LICENSE.md' }
  s.author       = { 'Evgeny Aleksandrov' => 'evgeny@aleksandrov.ws' }
  s.social_media_url = 'https://twitter.com/ealeksandrov'

  s.platform     = :ios, '9.0'
  s.source       = { :git => 'https://github.com/ealeksandrov/EARestrictedScrollView.git', :tag => s.version.to_s }
  s.source_files = 'Source/*.swift'

end
