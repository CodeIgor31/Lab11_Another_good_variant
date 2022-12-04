# frozen_string_literal: true

require 'test_helper'

class PalindromsControllerTest < ActionDispatch::IntegrationTest
  test 'should get index' do
    get palindroms_index_url
    assert_response :success
  end

  test 'should get result' do
    get palindroms_result_url
    assert_response :success
  end

  test 'should get check_page' do
    get palindroms_check_page_url
    assert_response :success
  end

  test 'should get check_exists' do
    get palindroms_check_exists_url
    assert_response :success
  end
end
