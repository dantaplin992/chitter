require 'pg'
require_relative './database_connection.rb'

class Peep

  def self.all
  end

  def self.create(text)
    DatabaseConnection.query(
      'INSERT INTO peeps (text) VALUES($1);',
      [text]
    )
  end

end