if ENV['RACK_ENV'] != 'production'
  require 'rspec/core/rake_task'

  RSpec::Core::RakeTask.new :spec

  task default: [:spec]
end

require 'pg'

task :initial_setup do
  print "🎟️ Setting up databases. Please standby...\n"

  ['blockchain', 'blockchain_test'].each do |database|
    con = PG.connect

    con.exec("CREATE DATABASE #{database};")

    con = PG.connect(dbname: "#{database}")
    con.exec('CREATE TABLE users(id SERIAL PRIMARY KEY, username VARCHAR(15), name VARCHAR(30), email VARCHAR(60), password VARCHAR(140));')

    print "🎟️ Database '#{database}' has been set up.\n"
  end

  print "🎟️ All of your databases have been set up. Have a nice day.\n"
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
  print "🎟️ All of your databases have been nuked. Have a nice day.\n"
end

task :setup_test_database do
  print "🎟️ Cleaning database tables. Please standby...\n"

  con = PG.connect dbname: 'blockchain_test'

  con.exec 'TRUNCATE users, peeps'
  print "🎟️ Your database tables are ready for action. Have a nice day.\n"
end