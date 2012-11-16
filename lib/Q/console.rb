module Q
  # Q::Console handles communication to console
  # later implementations will add logging and live-maintenance
  # for Q
  class Console

    # ansi console color constants
    COLOR_BLACK   = 0
    COLOR_RED     = 1
    COLOR_GREEN   = 2
    COLOR_YELLOW  = 3
    COLOR_BLUE    = 4
    COLOR_MAGENTA = 5
    COLOR_CYAN    = 6
    COLOR_WHITE   = 7

    # functional color aliases
    COLOR_WARN    = COLOR_YELLOW
    COLOR_ALERT   = COLOR_RED
    COLOR_CONFIRM = COLOR_GREEN
    COLOR_NOTE    = COLOR_BLUE

    # ansi-wrappers, see http://en.wikipedia.org/wiki/ANSI_escape_code
    def Console.txColorize(text, color); "\e[3#{color}m#{text}\e[39m"; end
    def Console.txUnderline(text); "\e[4m#{text}\e[24m"; end
    def Console.txBold(text); "\e[1m#{text}\e[22m"; end

    # Common ANSI-color shortcuts
    def Console.txAlert(text); txColorize(text, COLOR_ALERT); end
    def Console.txWarn(text); txColorize(text, COLOR_WARN); end
    def Console.txConfirm(text); txColorize(text, COLOR_CONFIRM); end
    def Console.txNote(text); txColorize(text, COLOR_NOTE); end
    def Console.txHead(text); txColorize(txBold(text), COLOR_BLUE); end
    def Console.txRef(text); txColorize(text, COLOR_MAGENTA); end
    def Console.txCode(text); txColorize(text, COLOR_CYAN); end

    # This is an extented sprintf-function that allowes usage of _type
    # substituted by bold type and _S substituted as code-notifier 
    def Console.txFormat(str, arrVals)
      myStr = str.dup()
      myStr.gsub!(/%(\d*)\$_S/, txCode('%\1$s'))
      myStr.gsub!(/%(\d*)\$_(.)/, txBold('%\1$\2'))
      sprintf(myStr, *arrVals)
    end

    # reinterpret ansi-color 'default' as last set color in given string
    # this is simply because most terminals dont implement a color-stack
    def Console.txSanitize!(str)
      color = [9]
      str.gsub!(/\e\[3([^m]+)m/) do
        if ($1 == '9')
          color.pop()
          c = color.last
        else
          color.push($1)
          c = $1
        end
        "\e[3#{c}m"
      end
    end

    # reminder of NOT YET IMPLEMENTED functionality
    def Console.nyi(text)
      out(txColorize('NYI: ' + txBold(text) + ' at ' + caller[0], COLOR_NOTE))
    end

    # shortcut to sanitize given string ant output it to console
    def Console.out(str)
      puts txSanitize!(str)
    end
  end
end
