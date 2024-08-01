#!/usr/bin/env ruby

filename = './data/w_data.dat'

# Initialize variables to track the day with the smallest temperature spread
min_spread = Float::INFINITY
day_with_min_spread = nil

# Define a lambda to process each line
process_line = lambda do |line, index|
  # Skipping the header lines
  next if index < 2
  columns = line.strip.split(/\s+/)

  # regex to ensure the first column is numeric
  next unless columns.length >= 3 && columns[0] =~ /^\d+$/

  day = columns[0].to_i
  max_temp = columns[1].to_i
  min_temp = columns[2].to_i

  spread = (max_temp - min_temp).abs

  # Update the tracking variables if the current spread is smaller
  if spread < min_spread
    min_spread = spread
    day_with_min_spread = day
  end
end

File.foreach(filename).with_index do |line, index|
  process_line.call(line, index)
end

puts "Day with the smallest temperature spread: #{day_with_min_spread} with a spread of #{min_spread}"