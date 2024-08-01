#!/usr/bin/env ruby

filename = './data/soccer.dat'

min_difference = Float::INFINITY
team_with_min_difference = nil

# Define a block to process each line
process_line = Proc.new do |line, index|
  # Skip the header lines
  next if index < 1

  # Split the line into an array of columns and remove any extra spaces
  columns = line.strip.split(/\s+/)

  next unless columns.length >= 9

  team_name = columns[1]
  goals_for = columns[6].to_i
  goals_against = columns[8].to_i

  # Absolute value to calculate the goal difference
  difference = (goals_for - goals_against).abs

  # Update the tracking variables if the current difference is smaller
  if difference < min_difference
    min_difference = difference
    team_with_min_difference = team_name
  end
end

# Read the file line by line and process each line using the block
File.foreach(filename).with_index do |line, index|
  process_line.call(line, index)
end

# Output the result
puts "Team with the smallest goal difference: #{team_with_min_difference} with a goal difference of #{min_difference}"