require 'codeforcesapi'
require 'yaml'

class Arena

	def initialize(contest_id, problem_index, p='.')
		@working_path = create_working_dir(p)
		@problem = Codeforcesapi.problem(contest_id, problem_index)

		create_contest
	end

	def create_contest

		contest_dir = File.join @working_path, @problem.contest_id
		Dir.mkdir(contest_dir) if not File.exist? contest_dir

		sourceFile = File.join(@working_path, @problem.contest_id, @problem.problem_index+'.rb')
		if not File.exist?(sourceFile)
			File.open(sourceFile, 'w') {|f|  f.puts "#Good luk for the Contest #{@problem.contest_id}, Problem: #{@problem.problem_index}"}
		end

		testFile = File.join(@working_path, @problem.contest_id, @problem.problem_index+'_sampleTest.txt')

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
		return File.expand_path(p) if File.directory? p
		Dir.pwd
	end


end
