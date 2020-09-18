# frozen_string_literal: true

require 'commander'

class RubyOnStairs
  include Commander::Methods

  def run # rubocop:disable Metrics/MethodLength
    program :name, 'ruby on stairs'
    program :version, '1.0.0'
    program :description, 'Organize and execute your ruby code by steps'
    program :help, 'Source Code', 'https://www.github.com/psunix/ruby-on-stairs'
    program :help, 'Usage', 'stairs [flags]'

    command :run do |c|
      c.syntax = 'cry run <step nr>'
      c.description = 'runs all or single steps/sub-step'

      c.action do |args|
        TTY::Exit.exit_with(:usage_error, 'Credentials missing') if args.empty?
        step_nr = args.first
        execute_action do
          stairs.run(step_nr)
        end
      end
    end
  end
end
