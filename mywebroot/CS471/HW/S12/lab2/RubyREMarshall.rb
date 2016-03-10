class Test
  def initialize(pattern, output_file)
    @pattern = pattern
    @output_file = output_file
  end

  def read_and_parse_from input_file
    File.open @output_file, 'w' do |output|
      output.puts "Info from #{input_file} matching group two of #{@pattern.inspect}"
      File.open input_file do |input|
        input.each do |line|
          if match = @pattern.match(line)
            output.puts match[2]
          end
        end
      end
    end
  end
end

Test.new(/(int)\s(.*)\(.*\);/, "output.txt").read_and_parse_from "input.c"
