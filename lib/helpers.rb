# frozen_string_literal: true

require 'pg'

def switch_db_if_test_env
  if ENV['ENVIRONMENT'] == 'test'
    dbname = 'blockchain_test'
  else
    dbname = 'blockchain'
  end
  @con = PG.connect dbname: "#{dbname}"
end
