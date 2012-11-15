class Hash
  def symbolize_keys
    self.inject({}) { |acc, tuple| acc.merge!(tuple[0].to_sym => tuple[1]) }
  end
end
