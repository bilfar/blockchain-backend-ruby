# frozen_string_literal: true

require 'pg'

def switch_db_if_test_env
  dbname = test_environment? ? 'blockchain_test' : 'blockchain'
  @con = PG.connect dbname: dbname.to_s
end

private

def test_environment?
  ENV['ENVIRONMENT'] == 'test'
end
