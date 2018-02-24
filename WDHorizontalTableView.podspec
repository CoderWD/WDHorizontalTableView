Pod::Spec.new do |s|
s.name             = "WDHorizontalTableView"
s.version          = "1.0.0"
s.summary          = "A horizontal tableview used on iOS."
s.description      = <<-DESC
It is a horizontal tableview used on iOS, which implement by Objective-C.
DESC
s.homepage         = "https://github.com/CoderWD/WDHorizontalTableView"
s.license          = 'MIT'
s.author           = { "何伟东" => "654500619@.com" }
s.source           = { :git => "https://github.com/CoderWD/WDHorizontalTableView.git", :tag => s.version.to_s }

s.platform     = :ios, '8.0'
s.requires_arc = true
s.source_files  = 'WDHorizontalTableView/WDHorizontal*.{h,m}'
s.frameworks = 'Foundation', 'CoreGraphics', 'UIKit', 'Security'
s.dependency 'WDKit'
s.dependency 'Masonry'

end
