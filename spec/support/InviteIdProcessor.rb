class InviteIdProcessor
  class << self
    def validate(name, value)
      true
    end

    def transform(name, value)
      value
    end
  end
end
