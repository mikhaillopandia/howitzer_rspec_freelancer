class InviteIdProcessor
  class << self
    def validate(_name, _value)
      true
    end

    def transform(_name, value)
      value
    end
  end
end
