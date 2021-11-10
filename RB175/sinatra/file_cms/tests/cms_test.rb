# frozen_string_literal: true

ENV['RACK_ENV'] = 'test'

require 'minitest/autorun'
require 'rack/test'

require_relative '../cms'

# rubocop:disable Style/Documentation
class CMSTest < Minitest::Test
  include Rack::Test::Methods

  def app
    Sinatra::Application
  end

  def test_index_page
    get '/'
    assert_equal(200, last_response.status)
    assert_equal('text/html;charset=utf-8', last_response['Content-Type'])
    assert_includes(last_response.body, 'about.txt')
    assert_includes(last_response.body, 'history.txt')
    assert_includes(last_response.body, 'changes.txt')
  end

  def test_about_txt
    get '/about.txt'
    assert_equal(200, last_response.status)
    assert_equal('text/plain;charset=utf-8', last_response['Content-Type'])
    assert_includes(last_response.body, 'Looks good on you.')
  end

  def test_valid_invalid_files
    get '/history.txt'
    assert_equal(200, last_response.status)
    assert_includes(last_response.body, 'Earth')
    get '/whoops.lol'
    assert_equal(302, last_response.status)
    get last_response['Location']
    assert_includes(last_response.body, 'does not exist')
  end
end
# rubocop:enable Style/Documentation
