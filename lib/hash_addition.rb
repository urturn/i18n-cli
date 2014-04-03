class Hash
  def recursively_stringify_keys!
    self.stringify_keys!
    self.values.each do |v|
      if v.is_a? Hash
        v.recursively_stringify_keys!
      elsif v.is_a? Array
        v.recursively_stringify_keys!
      end
    end
    self
  end
end