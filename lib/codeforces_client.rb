require "codeforces_client/version"
require "codeforces_client/arena.rb"
require 'open3'

module CodeforcesClient
  # Your code goes here...
  #
  def self.client( contestID, problemIndex, working_path='.')
    Arena.new(contestID, problemIndex)
  end

  def self.run_sample_test(problem_index)

  	test_file = File.join Dir.pwd, problem_index+'_sampleTest.txt'
  	if File.exist?(test_file)  		

  		myruby = File.join Config::CONFIG['bindir'], Config::CONFIG['ruby_install_name']
  		myscript = File.join Dir.pwd, problem_index+'.rb'

  		tests = File.read(test_file).gsub(/\r\n?/, "\n").strip.split("Sample test\n")[1..-1]
  		tests.map{|e| e.strip.split "\n\n"}.each_with_index do |each, index|
  			Open3.popen3(myruby,myscript) do |sin, sout|
  				sin.puts each[0]
  				res = sout.read.strip
  				if each[1] != res
  					print "FAIL test case:#{index}: \n"
  					print "***Expected: #{each[1]}\n"
  					print "***Received: #{res}\n"
  				else
  					puts "Test Case#{index} PASSED"
  				end
  			end
  		end
  	else
  		puts "there is no #{problem_index}_sampleTest.txt file, please check it"
  	end

  end
end
