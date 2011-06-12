require 'ripl'
require 'eventmachine'

module Ripl::Em
  VERSION = '0.1.0'

  def get_input
    history << @input
    @input
  end

  def in_loop
    catch(:ripl_exit) {
      EM.run { EM.open_keyboard(KeyboardHandler) }
    }
  rescue
    print_eval_error($!)
  end

  def before_loop
    super
    $stdout.sync = true
    Ripl::Shell::EXIT_WORDS << "\x00" # Ctrl-D + Enter exit
    trap("SIGINT") { handle_interrupt }
  end

  class KeyboardHandler < EM::Connection
    include EM::Protocols::LineText2

    def post_init
      print Ripl.shell.prompt
    end

    def receive_line(line)
      Ripl.shell.input = line
      Ripl.shell.loop_once
      print Ripl.shell.prompt
    end
  end
end

Ripl.config[:readline] = false
Ripl::Shell.include Ripl::Em
