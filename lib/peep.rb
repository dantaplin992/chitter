require 'pg'
require_relative './database_connection.rb'

class Peep

  def self.all
    result = DatabaseConnection.query(
      'SELECT * FROM peeps;'
    )
    result.map { |peep| { "id" => peep["id"], "text" => peep["text"], "date_time" => peep["date_time"], "username" => peep["username"] } }
    # result.map { |bookmark| {"id" => bookmark['id'], "url" => bookmark['url'], "title" => bookmark['title'] } }
  end

  def self.create(text, username='Anonymous')
    username = 'Anonymous' if username.empty?
    DatabaseConnection.query(
      'INSERT INTO peeps (text, username) VALUES($1, $2);',
      [text, username]
    )
  end

end