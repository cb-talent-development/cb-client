class String
  def camelize(first_letter_in_uppercase = true)
    if first_letter_in_uppercase
      self.to_s.gsub(/\/(.?)/) { "::#{$1.upcase}" }.gsub(/(?:^|_)(.)/) { $1.upcase }.gsub(/Id/, 'ID')
    else
      self[0..0].downcase + camelize[1..-1]
    end
  end
end
