module Codebreaker
  class Compare
    attr_accessor :secret_code, :mycode
    GAME_CODE_LENGTH = 4
    def initialize(secret_code)
      @secret_code = secret_code
    end
    
    def compare_codes(mycode)
      result_array = []
      i = 0
      while i < GAME_CODE_LENGTH
        if secret_code[i] == mycode[i]
          result_array << "+"
        elsif
          mycode.include? secret_code[i]
          result_array << "-"
        else
          result_array << ""
        end
        i += 1
      end
      result_array = result_array.sort
      #puts "Result code is [#{result_array.join}]"
      # result_array = []
      # GAME_CODE_LENGTH.times do |i = 0|
      #   if @secret_code.include? mycode[i]
      #     @secret_code[i] == mycode[i] ? result_array << "+" : result_array << "-"
      #   else
      #     result_array << " "
      #   end
      #   i += 1
      # end
      # result_array
    end
  end
end