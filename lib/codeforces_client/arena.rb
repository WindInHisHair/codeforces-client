require 'codeforcesapi'
require 'yaml'

class Arena

	def initialize(problem_id, problem_index, p)
		@working_path = create_working_dir(p)
		@problem = codeforcesapi::problem(probelm_id, problem_index)

		create_contest


	end

	def create_contest

		sourceFile = File.join @working_path, @problemIndex+'.rb'
		if not File.exist?(sourceFile)
			File.open(sourceFile, 'w') {|f|  f.puts "#Good luk for the Contest #{@problem.contestID}, Problem: #{@problem.problemIndex}"}
		end
		testFile = File.join @working_path, @problemIndex+'_sampleTest.txt'

		if not File.exist?(testFile)
			create_sample_test(testFile)
		end

	end

	def create_sample_test(fname)
		File.open(fname, 'w') do |f|
			1.upto(@problem.preTestInputs.size) do |i|
				f.puts 'Sample test'
				f.puts @problem.preTestInputs[i-1]
				f.puts
				f.puts @problem.preTestOutputs[i-1]			
			end
		end
	end

	def create_working_dir(p)
		p
	end


end
