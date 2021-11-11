# frozen_string_literal: true

# rubocop:disable Metrics/AbcSize
require 'fileutils'

ENV['RACK_ENV'] = 'test'

require 'minitest/autorun'
require 'rack/test'

require_relative '../cms'

# Create a document for use during testing
def create_document(filename, content = '')
  File.open(File.join(data_path, filename), 'w') do |file|
    file.write(content)
  end
end

# rubocop:disable Style/Documentation
class CMSTest < Minitest::Test
  include Rack::Test::Methods

  def setup
    FileUtils.mkdir_p(data_path)
  end

  def teardown
    FileUtils.rm_rf(data_path)
  end

  def app
    Sinatra::Application
  end

  def test_index_page
    create_document('about.md', "#This is a title.\n\nThis is a text document.")
    create_document('changes.txt', 'This is a text document.')
    get '/'
    assert_equal(200, last_response.status)
    assert_equal('text/html;charset=utf-8', last_response['Content-Type'])
    assert_includes(last_response.body, 'about.md')
    assert_includes(last_response.body, 'changes.txt')
  end

  def test_changes_txt
    text = 'This is a text document.'
    create_document('changes.txt', text)
    get '/changes.txt'
    assert_equal(200, last_response.status)
    assert_equal('text/html;charset=utf-8', last_response['Content-Type'])
    assert_includes(last_response.body, text)
  end

  def test_valid_invalid_files
    create_document('about.md', "#This is a title.\n\nThis is a text document.")
    get '/about.md'
    assert_equal(200, last_response.status)
    assert_includes(last_response.body, 'document')
    get '/whoops.lol'
    assert_equal(302, last_response.status)
    get last_response['Location']
    assert_includes(last_response.body, 'does not exist')
  end

  def test_markdown_files
    create_document('study-music.md', 'This was once a file. Now it only Echoes...')
    get '/study-music.md'
    assert_equal(200, last_response.status)
    assert_equal('text/html;charset=utf-8', last_response['Content-Type'])
    assert_includes(last_response.body, 'Echoes')
  end

  def test_file_editing
    text = 'Something or other.'
    create_document('about.txt', text)
    get '/about.txt/edit'
    assert_equal(200, last_response.status)
    assert_includes(last_response.body, text)
  end

  def test_file_updating
    create_document('about.txt', 'Something or other.')
    post('/about.txt/submit', file_content: 'blast off!')
    assert_equal(302, last_response.status)
    get(last_response['Location'])
    assert_includes(last_response.body, 'about.txt has been updated.')
    get('/about.txt')
    assert_equal(200, last_response.status)
    assert_includes(last_response.body, 'blast off!')
  end
end
# rubocop:enable Style/Documentation
# rubocop:enable Metrics/AbcSize
