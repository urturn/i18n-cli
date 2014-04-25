module LocaleFileIteration
  def self.extract_diffs(new, source, dest)
    key_modified = false
    new.each do |k,v|
      value = v
      if value.is_a?(Hash) && source
        dest[k] ||= {}
        deep_modified = extract_diffs(value, source[k], dest[k])
        if !deep_modified
          dest.delete(k)
        else
          key_modified = true
        end
      elsif (source && source[k] && source[k] != v)
        dest[k] = new[k]
        key_modified = true
      end
    end

    return key_modified
  end

  def self.add_missing(new, target, dest)
    key_modified = false
    new.each do |k,v|
      value = v
      if (!target || !target[k])
        dest[k] = v
        key_modified = true
      elsif value.is_a?(Hash)
        dest[k] ||= {}
        deep_modified = add_missing(value, target[k], dest[k])
        if (deep_modified)
          key_modified = true
        else
          dest.delete(k)
        end
      end
    end
    return key_modified
  end

  def self.remove_unused(base, target, cleaned)
    base.each do |k,v|
      value = v
      if value.is_a?(Hash)
        cleaned[k] = {}
        if (target && target[k])
          remove_unused(value, target[k], cleaned[k])
        end
      else
        if (target && target[k])
          cleaned[k] = target[k]
        end
      end
    end
  end
end