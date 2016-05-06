Pod::Spec.new do |s|

  s.name         = 'EARestrictedScrollView'
  s.version      = '2.0.1'
  s.summary      = 'UIScrollView sublass with ability to restrict or limit scrolling area.'
  s.screenshot   = 'https://raw.githubusercontent.com/ealeksandrov/EARestrictedScrollView/master/Screenshot01.png'
  s.homepage     = 'https://github.com/ealeksandrov/EARestrictedScrollView'
  s.license      = { :type => 'MIT', :file => 'LICENSE' }
  s.author       = { 'Evgeny Aleksandrov' => 'evgeny@aleksandrov.ws' }
  s.social_media_url = 'https://twitter.com/ealeksandrov'

  s.platform     = :ios, '8.0'
  s.source       = { :git => 'https://github.com/ealeksandrov/EARestrictedScrollView.git', :tag => s.version.to_s }
  s.source_files = 'Source/*.swift'

end
