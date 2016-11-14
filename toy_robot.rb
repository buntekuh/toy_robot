#!/usr/bin/env ruby

 #Command line interface
 #each line is input from the console

require './toy_robot/script_runner'

if ARGV.size > 1
  puts "either pass a path to file or no parameter at all"
	exit 1
end

if !ARGV[0].nil? 
	if File.exist?(ARGV[0])
		puts ToyRobot::ScriptRunner.run ARGV[0]
	else
		puts 'File could not be found'
	end
else
	sr = ToyRobot::ScriptRunner.new
	while true
		line = gets.chomp
		break if line == 'exit'
		puts sr.run_statement line
	end
end
