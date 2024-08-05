# spec/get_min_max_goals_spec.rb

require 'rspec'
require 'open3'

RSpec.describe 'get_min_max_goals.rb' do
  let(:script) { './get_min_max_goals.rb' }
  let(:data_file) { 'data/soccer.dat' }
  let(:wrong_file) { 'data/w_data.dat' }
  let(:expected_output) { "Team with the smallest goal difference: Aston Villa with a goal difference of 1\n" }
  let(:expected_error) { "Error: Required columns not found in the header.\n" }

  it 'outputs the correct team with the smallest goal difference' do
    stdout, stderr, status = Open3.capture3(script, data_file)
    expect(status).to be_success
    expect(stderr).to be_empty
    expect(stdout).to eq(expected_output)
  end

  it 'outputs an error message for incorrect file columns' do
    stdout, stderr, status = Open3.capture3(script, wrong_file)
    expect(status).not_to be_success
    expect(stderr).to be_empty
    expect(stdout).to eq(expected_error)
  end
end