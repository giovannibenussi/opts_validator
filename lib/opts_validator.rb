require 'colorize'
class OptsValidator
    def initialize(options, logger = nil)
        @options = options
        @logger  = logger
    end

    def validate_presence_of(symbol, description = nil, flag = nil)
        if @options[symbol].nil?
            if description.nil?
                message = "You must provide the #{symbol} parameter"
            else
                message = "You must provide the #{description} parameter"
                message += " (-#{flag} flag)" unless flag.nil?
            end
            unless @logger.nil?
                @logger.error(message)
            else
                puts message.red
            end
            exit
        end
    end
end
