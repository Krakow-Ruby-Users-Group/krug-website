if %w( test development ).include?(Rails.env)
  PolishGeeks::DevTools.setup do |config|
    config.rubycritic = false
  end
end
