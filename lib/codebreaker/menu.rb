module Codebreaker
  class Menu
    def main
      play_again = true
      while play_again == true
        system "clear"
        @computer = Computer.new
        @computer.generate_codes
        @compare = Compare.new(@computer.instance_variable_get(:@secret_code))
        puts "Welcome to Codebreaker.\nEnter digits from 1 to 6.\nType 'hint' to get a hint.\nType 'exit' to stop the game.\n\nChoose number of attempts:"
        attempts = gets.to_i
        game(attempts)
        puts "You used #{@turns} turns"
        puts "Enter your name: "
        name = gets.chomp
        write_to_file 'result_file', "\n\nPlayer: #{name}\nUsed #{@turns} turns.\nYour result code is: [#{@result_array.join}]"
        puts "Play again?[yes/no]"
        play_again = gets.chomp
        play_again = true if play_again == 'yes'
        play_again = false if play_again == 'no'
      end
    end

    private
      def game(attempts)
        @turns = 0
        attempts.times do |i|
          @result_array = @compare.compare_codes(get_user_code)
          puts "Result code is [#{@result_array.join}]"
          @turns += 1
          if @result_array.join.to_s == '++++'
            puts 'You win!!!'
            return
          end
        end
      end

      def get_user_code
        mycode = []
        puts "Please, enter a number between 1 to 6."
        i = 0
        element = 0
        while i < Compare::GAME_CODE_LENGTH
          element = gets.chomp
          if element == 'hint'
            puts @computer.hint
          elsif element == 'exit'
            exit
          else
            element = element.to_i
            if (element > 0 && element < 7)
              mycode << element
              i += 1
            else
              puts "Error! Enter a number between 1 to 6."
            end
            puts "Your code is: #{mycode}"
          end
        end
        mycode
      end

      def write_to_file(file_name, text)
        File.open("./files/#{file_name}.txt", 'a'){|file| file.write text}
      end
  end
end