require "db"
require "odbc"
require "option_parser"

# TODO: Write documentation for `Cr::Odbc`
module Cr::Odbc
  VERSION = "0.1.0"

  dsn = ""
  uid = ""
  pwd = ""

  OptionParser.parse do |parser|
    parser.banner = "Test application reading sysdate from Oracle DB with ODBC driver."
    parser.on("-d DSN", "--dsn=DSN", "Data source name") { |d| dsn = d }
    parser.on("-u USER", "--user=USER", "User name") { |u| uid = u }
    parser.on("-p PASSWORD", "--password=PASSWORD", "Password") { |p| pwd = p }
    parser.on("-h", "--help", "Show this help") do
      puts parser
      exit
    end
  end

  DB.open "odbc://DSN=#{dsn};UID=#{uid};PWD=#{pwd}" do |db|
    puts db.scalar "select sysdate from dual"
    db.query "select sysdate from dual" do |rs|
      puts "#{rs.column_name(0)}"
      rs.each do
        puts "#{rs.read(Time)}"
      end
    end
  end
end