# frozen_string_literal: true
require 'json'

# methods for input proc
module InputProc
  def user_inputs(hsh)
    puts 'Please add your inputs'

    hsh.each do |key, _value|
      print "#{key} --> "
      hsh[key] = gets.chomp
    end
    hsh
  end
end

# custom file writing
module FileProc
  def write_to_json_file(hsh, file_name)
    prettified_json = JSON.pretty_generate(hsh)
    IO.write("#{file_name}.json", prettified_json)
    puts "Successfully written to ./#{file_name}.json"
  end
end

# main Class
class MetaData
  include InputProc
  include FileProc
  attr_accessor :meta_data, :output_file_name

  def initialize(hsh, file_name)
    @meta_data = hsh
    @output_file_name = file_name
  end

  def start_app
    start_prompt
    write_to_json_file(@meta_data, @output_file_name)
  end

  private

  def start_prompt
    user_inputs(@meta_data)
  end
end

details = {
  template_label: '',
  template_name: '',
  figma_url: '',
  document_height: '',
  document_width: '',
  folder_name: '',
  sample_file_name: '',
  sample_interface_name: ''
}

# instantiate a new Metadata class
app = MetaData.new(details, 'stanley')
# get inputs and write to json file
app.start_app
