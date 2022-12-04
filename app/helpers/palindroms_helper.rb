# frozen_string_literal: true

# helping me
module PalindromsHelper
  def exists(value)
    obj = Palindrom.find_by(num: value)
    arr = obj[:result].split.map(&:to_i)
    sqr = obj[:squares].split.map(&:to_i)
    Hash[arr.zip sqr]
  end
end
