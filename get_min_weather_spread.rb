#!/usr/bin/env ruby

if ARGV.length != 1
  STDERR.puts "Usage: #{$0} <path_to_data_file>"
  exit 1
end

filename = ARGV[0]

# Initialize variables to track the day with the smallest temperature spread
min_spread = Float::INFINITY
day_with_min_spread = nil

# Define a lambda to process each line
process_line = lambda do |line, index|
  columns = line.strip.split(/\s+/)

  if index == 4
    # Map column names to their indices
    day_index = columns.index { |col| col.match?(/Dy/i) }
    max_temp_index = columns.index { |col| col.match?(/MxT/i) }
    min_temp_index = columns.index { |col| col.match?(/MnT/i) }

    if day_index.nil? || max_temp_index.nil? || min_temp_index.nil?
      STDERR.puts "Error: Required columns not found in the header."
      exit 1
    end

    @column_indices = {
      day: day_index,
      max_temp: max_temp_index,
      min_temp: min_temp_index
    }
    next
  end

  # Skipping the header lines
  next if index < 5
  next unless columns.length >= 3 && columns[@column_indices[:day]] =~ /^\d+$/

  day = columns[@column_indices[:day]].to_i
  max_temp = columns[@column_indices[:max_temp]].to_i
  min_temp = columns[@column_indices[:min_temp]].to_i

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
exit 0