require 'pg'

def switch_db_if_test_env
  ENV['ENVIRONMENT'] == 'test' ? dbname = 'blockchain_test' : dbname = 'blockchain'
  @con = PG.connect :dbname => "#{dbname}"
end
