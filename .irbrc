begin
  if RUBY_VERSION < '1.9.0'
    $KCODE='u'
  end

  require 'irb/completion'
  unless 'macirb' == File.basename($0)
    ARGV.concat ['--readline', '--prompt-mode', 'simple']
  end

  require 'pp'

  require 'irb/ext/save-history'
  IRB.conf[:SAVE_HISTORY] = 100
  IRB.conf[:HISTORY_FILE] = "#{ENV['HOME']}/.irb_history"

  # See http://bugs.ruby-lang.org/issues/show/1556
  # This is a patch to fix the bug in same way.
  if RUBY_VERSION == '1.8.7' &&
     IRB::HistorySavingAbility.respond_to?(:create_finalizer)
    module IRB
      class << self
        def irb_at_exit
          @CONF[:AT_EXIT].each{|hook| hook.call} if @CONF[:AT_EXIT]
        end
      end

      # NOTE See /lib/irb.rc.
      # I know this is not good, but there are no goot ways to patch
      # IRB.start from here because this method itself is called from there.
      # This hack if the caller can be assumed IRB.start, run IRB.irb_at_exit
      # at eval_input level.
      class Irb
        alias :_eval_input :eval_input
        def eval_input
          if caller.first =~ /irb.rb:[0-9]+:in `start'/
            begin
              _eval_input
            ensure
              IRB.irb_at_exit
            end
          else
            _eval_input
          end
        end
      end

      module HistorySavingAbility
        class << self
          def extended(obj)
            IRB.conf[:AT_EXIT] ||= []
            IRB.conf[:AT_EXIT].push(create_finalizer)
            obj.load_history
            obj
          end
        end
      end
    end
  end
rescue Object => e
  STDERR.puts "Fail to initialize irb. #{e.inspect}"
end

begin
  require 'rubygems'
  require 'wirb'
  Wirb.start
rescue LoadError
  STDERR.puts 'Fail to load wirb gem.'
rescue Object => e
  STDERR.puts "Fail to start wirb gem. #{e.inspect}"
end

# vim:ft=ruby
