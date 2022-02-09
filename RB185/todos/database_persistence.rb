# frozen_string_literal: true

require 'pg'

class DatabasePersistence
  def initialize(logger)
    @db = PG.connect(dbname: 'todos')
    @logger = logger
  end

  def query(statement, *params)
    @logger.info "Executing ~> '#{statement}': #{params}"
    @db.exec_params(statement, params)
  end

  def find_list(id)
    sql = 'SELECT * FROM lists WHERE id = $1'
    result = query(sql, id)
    tup = result.first
    { id: tup['id'], name: tup['name'], todos: todos_in_list(tup['id']) }
  end

  def all_lists
    sql  = 'SELECT * FROM lists;'
    result = query(sql)
    result.map do |tup|
      { id: tup['id'], name: tup['name'], todos: todos_in_list(tup['id']) }
    end
  end

  def create_new_list(list_name)
    sql = 'INSERT INTO lists (name) VALUES ($1)'
    query(sql, list_name)
  end

  def delete_list(id)
    todo_sql = 'DELETE FROM todos WHERE list_id = $1'
    query(todo_sql, id)
    sql = 'DELETE FROM lists WHERE id = $1'
    query(sql, id)
    # #! could we add ON DELETE CASCADE into todos schema instead of two queries here?
  end

  def update_list_name(id, new_name)
    sql = 'UPDATE lists SET name = $1 WHERE id = $2'
    query(sql, new_name, id)
  end

  def create_new_todo(list_id, todo_name)
    sql = 'INSERT INTO todos (name, list_id) VALUES ($1, $2)'
    query(sql, todo_name, list_id)
  end

  def delete_todo_from_list(list_id, todo_id)
    sql = 'DELETE FROM todos WHERE list_id = $1 AND id = $2'
    query(sql, list_id, todo_id)
  end

  def update_todo_status(list_id, todo_id, new_status)
    status = new_status ? 't' : 'f' # may work without this, but whatever
    sql = 'UPDATE todos SET completed = $1 WHERE list_id = $2 AND id = $3'
    query(sql, status, list_id, todo_id)
  end

  def mark_all_todos_as_completed(list_id)
    # list = find_list(list_id)
    # list[:todos].each do |todo|
    #   todo[:completed] = true
    # end
  end

  private

  def todos_in_list(list_id)
    sql = 'SELECT * FROM todos WHERE list_id = $1'
    result = query(sql, list_id)
    result.map { |tup| { id: tup['id'], name: tup['name'], completed: tup['completed'] == 't' } }
  end
end
