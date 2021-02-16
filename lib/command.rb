class Command
  attr_reader :command, :args

  def initialize(command, args = nil)
    @command = command.chomp
    @args = args if args
    raise 'ILLEGAL COMMAND' unless legal_commands.index(@command)
  end

  private

  def legal_commands
    ['PLACE','MOVE','LEFT', 'RIGHT', 'REPORT']
  end
end
