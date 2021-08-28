# Uncomment the next line to define a global platform for your project
# platform :ios, '9.0'

target 'Marvelous' do
  # Comment the next line if you don't want to use dynamic frameworks
  use_frameworks!

  plugin 'cocoapods-keys', {
    :project => "Marvelous",
    :keys => [
      "MarvelApiKey",
      "MarvelPrivateKey"
    ]}
  
  # Pods for Marvelous
  pod 'SnapKit', '~> 5.0.0'
  pod 'CryptoSwift'

  target 'MarvelousTests' do
    inherit! :search_paths
    # Pods for testing
  end

  target 'MarvelousUITests' do
    # Pods for testing
  end

end
