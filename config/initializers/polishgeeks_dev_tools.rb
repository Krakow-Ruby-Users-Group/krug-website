if %w( test development ).include?(Rails.env)
  PolishGeeks::DevTools.setup do |config|
    config.rubycritic = false
    config.haml_lint = false
    config.yml_parser = false
    config.brakeman = false
    config.rspec_files_structure = false
    config.rspec = false
    config.simplecov = false
    config.simplecov_threshold = false
  end
end
