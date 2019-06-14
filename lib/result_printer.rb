class ResultPrinter
	def initialize(game)
		@status_image = []
		counter = 0

		while counter <= game.max_errors do
			file_name = "#{__dir__}/../images/#{counter}.txt"

			if File.exist?(file_name)
				@status_image << File.read(file_name)
			else
				@status_image << "\n[Изображение не найдено]\n"
			end
			counter += 1
		end
	end

	def  print_status(game)
		cls

		puts game.version unless game.version.nil?

		puts "\nСлово: " + get_word_for_print(game.letters, game.good_letters)
		puts "Ошибки (#{game.errors}): #{game.bad_letters.join(", ")}"

		print_viselitsa(game.errors)

		print_status_message(game)
	end

	def print_status_message(game)
		if game.lost?
			puts "Вы проиграли :( Загаданное слово: #{game.word}"
		elsif game.won?
			puts "Поздравляем! Вы выиграли!\n\n"
		else
			puts "У вас осталось попыток: #{game.errors_left}"
		end
	end

	def get_word_for_print(letters, good_letters)
		result = ""

		for item in letters do
			if good_letters.include? item
				result += item + " "
			else
				result += "__ "
			end
		end
		result
	end

	def cls
		system "clear" or system "cls"
	end

	def print_viselitsa(errors)
		puts @status_image[errors]
	end
end
