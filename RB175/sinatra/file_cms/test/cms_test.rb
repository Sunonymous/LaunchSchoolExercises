# frozen_string_literal: true

# rubocop:disable Metrics/ClassLength
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

# Access session variables
def session
  last_request.env['rack.session']
end

# Shortcut for logging in user
def admin_session
  { 'rack.session' => { user: 'admin' } }
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
    assert_equal('text/plain', last_response['Content-Type'])
    assert_includes(last_response.body, text)
  end

  def test_valid_invalid_files
    create_document('about.md', "#This is a title.\n\nThis is a text document.")
    get '/about.md'
    assert_equal(200, last_response.status)
    assert_includes(last_response.body, 'document')
    get '/whoops.lol'
    assert_equal(302, last_response.status)
    assert_equal("The file 'whoops.lol' does not exist.", session[:message])
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
    get('/about.txt/edit') # not signed in
    assert_equal('You must be signed in to do that.', session[:message])
    get('/about.txt/edit', {}, admin_session)
    assert_equal(200, last_response.status)
    assert_includes(last_response.body, text)
  end

  def test_file_updating
    create_document('about.txt', 'Something or other.')
    post('/about.txt/submit', file_content: 'blast off!') # not signed in
    assert_equal(302, last_response.status)
    assert_equal('You must be signed in to do that.', session[:message])
    post('/about.txt/submit', { file_content: 'blast off!' }, admin_session)
    assert_equal(302, last_response.status)
    assert_equal('about.txt has been updated.', session[:message])
    get('/about.txt')
    assert_equal(200, last_response.status)
    assert_includes(last_response.body, 'blast off!')
  end

  def test_new_document_creation
    get('/new') # not signed in
    assert_equal('You must be signed in to do that.', session[:message])
    get('/new', {}, admin_session)
    assert_equal(200, last_response.status)
    assert_includes(last_response.body, 'Add a new document:')
    assert_includes(last_response.body, 'type="submit"')
  end

  def test_create_duplicate_document
    create_document('hello.txt', 'hello!')
    post('/new', filename: 'hello.txt') # not signed in
    assert_equal('You must be signed in to do that.', session[:message])
    post('/new', { filename: 'hello.txt' }, admin_session)
    assert_equal(422, last_response.status)
    assert_includes(last_response.body, 'A file with this name already exists!')
  end

  def test_create_document_with_empty_filename
    post('/new', filename: '') # not signed in
    assert_equal('You must be signed in to do that.', session[:message])
    post('/new', { filename: '' }, admin_session)
    assert_equal(422, last_response.status)
    assert_includes(last_response.body, 'A filename must be included to create a file!')
  end

  def test_create_document_without_extension
    post('/new', filename: 'hello') # not signed in
    assert_equal('You must be signed in to do that.', session[:message])
    post('/new', { filename: 'hello' }, admin_session)
    assert_equal(422, last_response.status)
    assert_includes(last_response.body, 'Unable to create file without extension.')
  end

  def test_create_document_with_bad_extension
    post('/new', filename: 'hello.lol') # not signed in
    assert_equal('You must be signed in to do that.', session[:message])
    post('/new', { filename: 'hello.lol' }, admin_session)
    assert_equal(422, last_response.status)
    assert_includes(last_response.body, "Unable to create files of filetype 'lol'.")
    get('/')
  end

  def test_create_document_success
    post('/new', filename: 'hi-there.txt') # not signed in
    assert_equal('You must be signed in to do that.', session[:message])
    post('/new', { filename: 'hi-there.txt' }, admin_session)
    assert_equal("File 'hi-there.txt' created successfully.", session[:message])
    get('/')
    assert_includes(last_response.body, 'hi-there.txt')
  end

  def test_delete_document
    create_document('super.txt', 'i am super! or maybe souper? soupier than you!')
    get('/')
    assert_includes(last_response.body, 'super.txt') # file is present
    post('/super.txt/delete') # not signed in
    assert_equal('You must be signed in to do that.', session[:message])
    post('/super.txt/delete', {}, admin_session)
    assert_equal(302, last_response.status)
    assert_equal("File 'super.txt' deleted successfully.", session[:message])
    get('/')
    refute_includes(last_response.body, '>super.txt</a>')
  end

  def test_delete_invalid_document
    post('/silly.txt/delete')
    assert_equal(302, last_response.status)
    assert_equal('Unable to delete file silly.txt. Are you sure it exists?', session[:message])
  end

  def test_login_page
    get('/login')
    assert_equal(200, last_response.status)
    assert_includes(last_response.body, 'Username:')
    assert_includes(last_response.body, 'Password:')
    assert_includes(last_response.body, '<form')
  end

  def test_invalid_credentials
    post('/login', username: 'doopydude', password: 'null')
    assert_equal(422, last_response.status)
    assert_includes(last_response.body, 'Invalid credentials.')
  end

  def test_user_login
    get('/')
    assert_includes(last_response.body, 'SIGN IN')
    post('/login', username: 'dig', password: 'dug')
    assert_equal(302, last_response.status)
    assert_equal('Welcome back, dig!', session[:message])
    get(last_response['Location'])
    assert_includes(last_response.body, 'Currently signed in as dig')
  end

  def test_user_sign_out
    get('/')
    post('/login', username: 'carl', password: 'larc')
    get(last_response['Location'])
    assert_includes(last_response.body, 'Welcome back, carl!')
    post('/sign-out')
    assert_equal('You have been signed out.', session[:message])
    get(last_response['Location'])
    assert_nil(session[:user])
    assert_includes(last_response.body, 'SIGN IN')
  end
end

# rubocop:enable Style/Documentation
# rubocop:enable Metrics/AbcSize
# rubocop:enable Metrics/ClassLength
