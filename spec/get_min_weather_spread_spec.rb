# spec/get_min_weather_spread_spec.rb

require 'rspec'
require 'open3'

RSpec.describe 'get_min_weather_spread.rb' do
  let(:script) { './get_min_weather_spread.rb' }
  let(:data_file) { 'data/w_data.dat' }
  let(:wrong_file) { 'data/soccer.dat' }
  let(:expected_output) { "Day with the smallest temperature spread: 14 with a spread of 2\n" }
  let(:expected_error) { "Error: Required columns not found in the header.\n" }

  it 'outputs the correct day with the smallest temperature spread' do
    stdout, stderr, status = Open3.capture3(script, data_file)
    expect(status.exitstatus).to eq(0)
    expect(stderr).to be_empty
    expect(stdout).to eq(expected_output)
  end

  it 'outputs an error message for incorrect file format' do
    stdout, stderr, status = Open3.capture3(script, wrong_file)
    expect(status.exitstatus).to eq(1)
    expect(stdout).to be_empty
    expect(stderr).to eq(expected_error)
  end
end
