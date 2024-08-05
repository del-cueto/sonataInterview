#!/usr/bin/env ruby

if ARGV.length != 1
  p "Usage: #{$0} <path_to_data_file>"
  exit 1
end

filename = ARGV[0]

min_difference = Float::INFINITY
team_with_min_difference = nil

# Define a block to process each line
process_line = Proc.new do |line, index|
  columns = line.strip.split(/\s+/)
  if index == 2
    # Map column names to their indices
    team_index = columns.index { |col| col.match?(/Team/i) }
    goals_for_index = columns.index { |col| col.match?(/^F$/i) }
    goals_against_index = columns.index { |col| col.match?(/^A$/i) }

    if team_index.nil? || goals_for_index.nil? || goals_against_index.nil?
      puts "Error: Required columns not found in the header."
      exit 1
    end

    @column_indices = {
      team_name: team_index + 1,
      goals_for: goals_for_index + 1,
      goals_against: goals_against_index + 2
    }
    next
  end

  next if index < 3
  next unless columns.length >= 9

  team_name = columns[@column_indices[:team_name]].gsub('_', ' ')
  goals_for = columns[@column_indices[:goals_for]].to_i
  goals_against = columns[@column_indices[:goals_against]].to_i
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
exit 0