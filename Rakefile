# frozen_string_literal: true

if ENV['RACK_ENV'] != 'production'
  require 'rspec/core/rake_task'

  RSpec::Core::RakeTask.new :spec

  task default: [:spec]
end

require 'pg'

task :setup do
  print "🎟 Setting up databases. Please standby...\n"

  ['blockchain', 'blockchain_test'].each do |database|
    con = PG.connect

    con.exec("CREATE DATABASE #{database};")

    con = PG.connect(dbname: "#{database}")

    con.exec('CREATE TABLE blocks(id SERIAL PRIMARY KEY, sender CHAR(64), ' \
             'receiver CHAR(64), value INT, previous_tx CHAR(64));')
    con.exec('INSERT INTO blocks(sender, receiver, value, previous_tx) VALUES' \
              "('#{'0' * 64}', '#{'0' * 64}', 0, '#{'0' * 64}');")

    print "🎟️Database '#{database}' and Genesis Block have been set up.\n"
  end

  print "🎟️All of your databases have been set up. Have a nice day.\n"
end

task :nuke do
  print "💀 Are you sure you want to nuke the databases? Type 'y' to confirm.\n"
  confirm = STDIN.gets.chomp
  return unless confirm == 'y'

  ['blockchain', 'blockchain_test'].each do |database|
    con = PG.connect
    con.exec("DROP DATABASE #{database}")
    print "💀 Database '#{database}' has been nuked.\n"
  end
  print "💀️All of your databases have been nuked. Have a nice day.\n"
end

task :setup_travis_database do
  print "🎟️ Setting up Travis CI test database. Please standby...\n"

  con = PG.connect dbname: 'blockchain_test'

  con.exec('CREATE TABLE blocks(id SERIAL PRIMARY KEY, sender CHAR(64), ' \
           'receiver CHAR(64), value INT, previous_tx CHAR(64));')
end

task :clean_test_database do
  print "🎟️ Cleaning database tables. Please standby...\n"

  con = PG.connect dbname: 'blockchain_test'

  con.exec 'TRUNCATE blocks'
  print "🎟️ Your database tables are ready for action.\n"
end

task :insert_genesis_block do
  @con = PG.connect dbname: 'blockchain_test'

  @con.exec('INSERT INTO blocks(sender, receiver, value, previous_tx) VALUES' \
            "('#{'0' * 64}', '#{'0' * 64}', 0, '#{'0' * 64}');")

  print "🎟️ Genesis Block inserted into test database.\n"
end
