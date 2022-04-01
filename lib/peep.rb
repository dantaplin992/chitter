require 'pg'
require_relative './database_connection.rb'
require 'date'

class Peep

  def self.all
    result = DatabaseConnection.query(
      'SELECT * FROM peeps ORDER BY date_time DESC;'
    )
    result.map { |peep| { "id" => peep["id"], "text" => peep["text"], "date_time" => peep["date_time"], "username" => peep["username"] } }
    # result.map { |bookmark| {"id" => bookmark['id'], "url" => bookmark['url'], "title" => bookmark['title'] } }
  end

  def self.create(text, username='Anonymous')
    username = 'Anonymous' if username.empty?
    DatabaseConnection.query(
      'INSERT INTO peeps (text, date_time, username) VALUES($1, $2, $3);',
      [text, self.get_date, username]
    )
  end

  def self.search(keyword)
    result = DatabaseConnection.query(
      "SELECT * FROM peeps WHERE text LIKE '%#{keyword}%';",
      []
    )
    result.map { |peep| { "id" => peep["id"], "text" => peep["text"], "date_time" => peep["date_time"], "username" => peep["username"] } }
  end

  def self.get_date
    DateTime.now
  end

end
