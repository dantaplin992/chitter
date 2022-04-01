require 'database_connection'

RSpec.describe DatabaseConnection do
  it 'sets up a connection to the database through PG' do
    expect(PG).to receive(:connect).with(dbname: 'chitter_test')

    DatabaseConnection.setup('chitter_test')
  end

  it 'persists the connection' do
    connection = DatabaseConnection.setup('chitter_test')
    expect(DatabaseConnection.connection).to eq connection
  end

  it 'executes a query via PG' do
    connection = DatabaseConnection.setup('chitter_test')

    expect(connection).to receive(:exec_params).with("SELECT * FROM peeps;", [])

    DatabaseConnection.query("SELECT * FROM peeps;")
  end
end