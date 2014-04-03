module FileLoading
  def self.load(file)
    loaded_file = YAML::load_file(file)
    locale = loaded_file.keys.first
    return loaded_file[locale]
  end

  def self.save(content, locale, path)
    content_with_locale = {}
    content_with_locale[locale] = content
    File.open(path, "w") {|f| f.write(content_with_locale.to_yaml)}
  end
end