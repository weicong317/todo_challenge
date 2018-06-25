# Pre-configurations (Change if you want an awesome difficulty assessment)
require_relative 'config/application'

# Your Code begins from this line onwards #
input = ARGV
p input
command = input[0].slice(2..-1)

case command
when "list"
	x = Task.all
	puts "#{'No.'.ljust(4)} #{'Description'.ljust(40)} Status"
	puts "#{'='.ljust(4, '=')} #{'='.ljust(40, '=')} ======"
	x.each_with_index do |row, index|
		puts "#{index + 1}#{'.'.ljust(3)} #{row.description.ljust(40)} #{row.status}"
	end
when "add"
	description = input[1]
	status = input[2]
	Task.create(description: description, status: status)
when "update"
	temp_status = 0
	no = input[1].to_i
	description = input[2]
	status = input[3]
	x = Task.all
	x.each_with_index do |row, index|
		if index + 1 === no
			y = Task.find(row.id)
			y.update(description: description, status: status)
			temp_status = 1
		end
	end
	if temp_status === 0
		puts "Task number #{no} is not found. Are you sure that this is the right task number?"
	end
when "remove"
	temp_status = 0
	no = input[1].to_i
	x = Task.all
	x.each_with_index do |row, index|
		if index + 1 === no
			y = Task.find(row.id)
			y.delete
			temp_status = 1
		end
	end
	if temp_status === 0
		puts "Task number #{no} is not found. Are you sure that this is the right task number?"
	end
else
	puts "Wrong command"
end