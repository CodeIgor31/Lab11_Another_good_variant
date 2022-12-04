# frozen_string_literal: true

# Main controller
class PalindromsController < ApplicationController
  def index; end

  def result
    @flag = false
    @number = form_params
    @palindrom = Palindrom.find_by(num: params[:numb])
    return @hash = Hash[@palindrom.result.split.zip @palindrom.squares.split] unless @palindrom.nil?

    @palindrom = Palindrom.new(num: params[:numb])
    return unless @palindrom.valid?

    @palindrom.save
    @flag = true
    @hash = Hash[@palindrom.result.split.zip @palindrom.squares.split]
  end

  def check_page; end

  def check_exists
    @check_par = check_form_params
    @check_palindrom = Palindrom.new(@check_par)
    @check_res = @check_palindrom.check_existing
  end

  def check_data_xml
    render xml: Palindrom.all
  end

  private

  def form_params
    params.permit(:numb)
  end

  def check_form_params
    params.permit(:check)
  end
end
