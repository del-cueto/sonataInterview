# spec/file_permissions_spec.rb

require 'rspec'

RSpec.describe 'File Permissions' do
  Dir.glob('./data/*').each do |filename|
    context "File: #{filename}" do
      it 'can be read' do
        expect(File).to be_readable(filename)
      end

      it 'has read permissions' do
        expect(File.stat(filename).mode & 0444).to be > 0
      end
    end
  end
end