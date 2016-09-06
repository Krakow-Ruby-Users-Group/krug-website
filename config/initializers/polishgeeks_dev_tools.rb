if %w( test development ).include?(Rails.env)
  PolishGeeks::DevTools.setup do |config|
    config.rubycritic = false
    config.yml_parser = false
    config.brakeman = false
  end
end
