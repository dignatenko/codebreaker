module Codebreaker
  class Computer
    attr_writer :secret_code
    COUNT_OF_HINTS = 1
    def initialize
      @count_of_hints = 0
    end
    
    def hint
      if @count_of_hints < COUNT_OF_HINTS
        @count_of_hints += 1
        @secret_code[rand(0..3)]
      else
        'You have no more hints'
      end
    end

    def generate_codes
      @secret_code = Array.new(Compare::GAME_CODE_LENGTH){rand(1..6)}
    end
  end
end
