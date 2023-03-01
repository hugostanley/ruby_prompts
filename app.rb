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

module FileProc

  def write_to_file(hsh, file_name)
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

  def initialize
    @meta_data = { template_name: '', template_label: '' }
    @output_file_name = ''
  end

  def start_app(file_name)
    start_prompt
    write_to_file(@meta_data, file_name)
  end

  private

  def start_prompt
    @meta_data = user_inputs(@meta_data)
  end
end

app = MetaData.new
app.start_app('ama_data')
