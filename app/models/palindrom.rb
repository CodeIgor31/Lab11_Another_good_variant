# frozen_string_literal: true

# good
class Palindrom < ApplicationRecord
  include ActiveModel::Serializers::Xml
  include PalindromsHelper

  attr_accessor :check

  validates :num, presence: { message: 'не может быть пустым' }
  validates_numericality_of :num, only_integer: true, greater_than_or_equal_to: 0
  before_save :result_into_bd
  self.primary_key = :num

  def result_into_bd
    number = num.to_i
    arr = (0..number).select do |elem|
      elem.to_s == elem.to_s.reverse && (elem**2).to_s == (elem**2).to_s.reverse
    end
    self.result = Array(arr).join(' ')
    self.squares = Array(arr).map { |el| el**2 }.join(' ')
    self.count = Array(arr).size
  end

  def check_existing
    check_val = check
    if Palindrom.find_by(num: check_val).nil?
      nil
    else
      exists(check_val)
    end
  end
end
