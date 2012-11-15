module Q
  class Console

    # ansi-wrappers, see http://en.wikipedia.org/wiki/ANSI_escape_code
    def Console.txColorize(text, color); "\e[3#{color}m#{text}\e[39m"; end
    def Console.txUnderline(text); "\e[4m#{text}\e[24m"; end
    def Console.txBold(text); "\e[1m#{text}\e[22m"; end

    # ansi console color constants
    COLOR_BLACK   = 0
    COLOR_RED     = 1
    COLOR_GREEN   = 2
    COLOR_YELLOW  = 3
    COLOR_BLUE    = 4
    COLOR_MAGENTA = 5
    COLOR_CYAN    = 6
    COLOR_WHITE   = 7

    COLOR_WARN    = COLOR_YELLOW
    COLOR_ALERT   = COLOR_RED
    COLOR_CONFIRM = COLOR_GREEN
    COLOR_NOTE    = COLOR_BLUE

    def Console.txAlert(text); txColorize(text, COLOR_ALERT); end
    def Console.txWarn(text); txColorize(text, COLOR_WARN); end
    def Console.txConfirm(text); txColorize(text, COLOR_CONFIRM); end
    def Console.txNote(text); txColorize(text, COLOR_NOTE); end
    def Console.txHead(text); txColorize(txBold(text), COLOR_BLUE); end
  end
end
