# typed: true

# DO NOT EDIT MANUALLY
# This is an autogenerated file for types exported from the `dotenv` gem.
# Please instead update this file by running `bin/tapioca gem dotenv`.

# Shim to load environment variables from `.env files into `ENV`.
#
# source://dotenv//lib/dotenv/substitutions/variable.rb#3
module Dotenv
  extend ::Dotenv

  # Returns the value of attribute instrumenter.
  #
  # source://dotenv//lib/dotenv.rb#14
  def instrumenter; end

  # Sets the attribute instrumenter
  #
  # @param value the value to set the attribute instrumenter to.
  #
  # source://dotenv//lib/dotenv.rb#14
  def instrumenter=(_arg0); end

  # Loads environment variables from one or more `.env` files. See `#parse` for more details.
  #
  # source://dotenv//lib/dotenv.rb#17
  def load(*filenames, overwrite: T.unsafe(nil), ignore: T.unsafe(nil)); end

  # Same as `#load`, but raises Errno::ENOENT if any files don't exist
  #
  # source://dotenv//lib/dotenv.rb#26
  def load!(*filenames); end

  # Modify `ENV` for the block and restore it to its previous state afterwards.
  #
  # Note that the block is synchronized to prevent concurrent modifications to `ENV`,
  # so multiple threads will be executed serially.
  #
  # @param env [Hash] Hash of keys and values to set in `ENV`
  #
  # source://dotenv//lib/dotenv.rb#112
  def modify(env = T.unsafe(nil), &block); end

  # same as `#load`, but will overwrite existing values in `ENV`
  #
  # source://dotenv//lib/dotenv.rb#31
  def overload(*filenames); end

  # same as `#overwrite`, but raises Errno::ENOENT if any files don't exist
  #
  # source://dotenv//lib/dotenv.rb#37
  def overload!(*filenames); end

  # same as `#load`, but will overwrite existing values in `ENV`
  #
  # source://dotenv//lib/dotenv.rb#31
  def overwrite(*filenames); end

  # same as `#overwrite`, but raises Errno::ENOENT if any files don't exist
  #
  # source://dotenv//lib/dotenv.rb#37
  def overwrite!(*filenames); end

  # Parses the given files, yielding for each file if a block is given.
  #
  # @param filenames [String, Array<String>] Files to parse
  # @param overwrite [Boolean] Overwrite existing `ENV` values
  # @param ignore [Boolean] Ignore non-existent files
  # @param block [Proc] Block to yield for each parsed `Dotenv::Environment`
  # @return [Hash] parsed key/value pairs
  #
  # source://dotenv//lib/dotenv.rb#49
  def parse(*filenames, overwrite: T.unsafe(nil), ignore: T.unsafe(nil), &block); end

  # @raise [MissingKeys]
  #
  # source://dotenv//lib/dotenv.rb#122
  def require_keys(*keys); end

  # Restore `ENV` to a given state
  #
  # @param env [Hash] Hash of keys and values to restore, defaults to the last saved state
  # @param safe [Boolean] Is it safe to modify `ENV`? Defaults to `true` in the main thread, otherwise raises an error.
  #
  # source://dotenv//lib/dotenv.rb#76
  def restore(env = T.unsafe(nil), safe: T.unsafe(nil)); end

  # Save the current `ENV` to be restored later
  #
  # source://dotenv//lib/dotenv.rb#66
  def save; end

  # Update `ENV` with the given hash of keys and values
  #
  # @param env [Hash] Hash of keys and values to set in `ENV`
  # @param overwrite [Boolean] Overwrite existing `ENV` values
  #
  # source://dotenv//lib/dotenv.rb#94
  def update(env = T.unsafe(nil), overwrite: T.unsafe(nil)); end

  private

  # source://dotenv//lib/dotenv.rb#130
  def instrument(name, payload = T.unsafe(nil), &block); end
end

# A diff between multiple states of ENV.
#
# source://dotenv//lib/dotenv/diff.rb#3
class Dotenv::Diff
  # Create a new diff. If given a block, the state of ENV after the block will be preserved as
  # the final state for comparison. Otherwise, the current ENV will be the final state.
  #
  # @param a [Hash] the initial state, defaults to a snapshot of current ENV
  # @param b [Hash] the final state, defaults to the current ENV
  # @return [Diff] a new instance of Diff
  # @yield [diff] a block to execute before recording the final state
  #
  # source://dotenv//lib/dotenv/diff.rb#16
  def initialize(a: T.unsafe(nil), b: T.unsafe(nil), &block); end

  # The initial state
  #
  # source://dotenv//lib/dotenv/diff.rb#5
  def a; end

  # Return a Hash of keys added with their new values
  #
  # source://dotenv//lib/dotenv/diff.rb#24
  def added; end

  # Returns true if any keys were added, removed, or changed
  #
  # @return [Boolean]
  #
  # source://dotenv//lib/dotenv/diff.rb#46
  def any?; end

  # The final or current state
  #
  # source://dotenv//lib/dotenv/diff.rb#8
  def b; end

  # Returns of Hash of keys changed with an array of their previous and new values
  #
  # source://dotenv//lib/dotenv/diff.rb#34
  def changed; end

  # Returns a Hash of all added, changed, and removed keys and their new values
  #
  # source://dotenv//lib/dotenv/diff.rb#41
  def env; end

  # Returns a Hash of keys removed with their previous values
  #
  # source://dotenv//lib/dotenv/diff.rb#29
  def removed; end

  private

  # source://dotenv//lib/dotenv/diff.rb#52
  def snapshot; end
end

# A `.env` file that will be read and parsed into a Hash
#
# source://dotenv//lib/dotenv/environment.rb#3
class Dotenv::Environment < ::Hash
  # Create a new Environment
  #
  # @param filename [String] the path to the file to read
  # @param overwrite [Boolean] whether the parser should assume existing values will be overwritten
  # @return [Environment] a new instance of Environment
  #
  # source://dotenv//lib/dotenv/environment.rb#10
  def initialize(filename, overwrite: T.unsafe(nil)); end

  # Returns the value of attribute filename.
  #
  # source://dotenv//lib/dotenv/environment.rb#4
  def filename; end

  # source://dotenv//lib/dotenv/environment.rb#17
  def load; end

  # Returns the value of attribute overwrite.
  #
  # source://dotenv//lib/dotenv/environment.rb#4
  def overwrite; end

  # source://dotenv//lib/dotenv/environment.rb#21
  def read; end
end

# source://dotenv//lib/dotenv/missing_keys.rb#2
class Dotenv::Error < ::StandardError; end

# Error raised when encountering a syntax error while parsing a .env file.
#
# source://dotenv//lib/dotenv/parser.rb#6
class Dotenv::FormatError < ::SyntaxError; end

# Logs instrumented events
#
# Usage:
#   require "active_support/notifications"
#   require "dotenv/log_subscriber"
#   Dotenv.instrumenter = ActiveSupport::Notifications
#
# source://dotenv//lib/dotenv/log_subscriber.rb#11
class Dotenv::LogSubscriber < ::ActiveSupport::LogSubscriber
  # source://dotenv//lib/dotenv/log_subscriber.rb#18
  def load(event); end

  # source://dotenv//lib/dotenv/log_subscriber.rb#14
  def logger; end

  # source://dotenv//lib/dotenv/log_subscriber.rb#34
  def restore(event); end

  # source://dotenv//lib/dotenv/log_subscriber.rb#30
  def save(event); end

  # source://dotenv//lib/dotenv/log_subscriber.rb#24
  def update(event); end

  private

  # source://dotenv//lib/dotenv/log_subscriber.rb#57
  def color_env_constant; end

  # source://dotenv//lib/dotenv/log_subscriber.rb#49
  def color_filename(filename); end

  # source://dotenv//lib/dotenv/log_subscriber.rb#53
  def color_var(name); end
end

# source://dotenv//lib/dotenv/missing_keys.rb#4
class Dotenv::MissingKeys < ::Dotenv::Error
  # @return [MissingKeys] a new instance of MissingKeys
  #
  # source://dotenv//lib/dotenv/missing_keys.rb#5
  def initialize(keys); end
end

# Parses the `.env` file format into key/value pairs.
# It allows for variable substitutions, command substitutions, and exporting of variables.
#
# source://dotenv//lib/dotenv/parser.rb#10
class Dotenv::Parser
  # @return [Parser] a new instance of Parser
  #
  # source://dotenv//lib/dotenv/parser.rb#40
  def initialize(string, overwrite: T.unsafe(nil)); end

  # source://dotenv//lib/dotenv/parser.rb#46
  def call; end

  private

  # source://dotenv//lib/dotenv/parser.rb#82
  def expand_newlines(value); end

  # source://dotenv//lib/dotenv/parser.rb#62
  def parse_line(line); end

  # source://dotenv//lib/dotenv/parser.rb#70
  def parse_value(value); end

  # source://dotenv//lib/dotenv/parser.rb#104
  def perform_substitutions(value, maybe_quote); end

  # source://dotenv//lib/dotenv/parser.rb#78
  def unescape_characters(value); end

  # source://dotenv//lib/dotenv/parser.rb#94
  def unescape_value(value, maybe_quote); end

  # @return [Boolean]
  #
  # source://dotenv//lib/dotenv/parser.rb#90
  def variable_not_set?(line); end

  class << self
    # source://dotenv//lib/dotenv/parser.rb#35
    def call(*_arg0, **_arg1, &_arg2); end

    # Returns the value of attribute substitutions.
    #
    # source://dotenv//lib/dotenv/parser.rb#33
    def substitutions; end
  end
end

# source://dotenv//lib/dotenv/parser.rb#14
Dotenv::Parser::LINE = T.let(T.unsafe(nil), Regexp)

# Rails integration for using Dotenv to load ENV variables from a file
#
# source://dotenv//lib/dotenv/rails.rb#20
class Dotenv::Rails < ::Rails::Railtie
  # @return [Rails] a new instance of Rails
  #
  # source://dotenv//lib/dotenv/rails.rb#23
  def initialize; end

  # source://dotenv//lib/dotenv/rails.rb#21
  def autorestore(*_arg0, **_arg1, &_arg2); end

  # source://dotenv//lib/dotenv/rails.rb#21
  def autorestore=(arg); end

  # source://dotenv//lib/dotenv/rails.rb#75
  def deprecator; end

  # The current environment that the app is running in.
  #
  # When running `rake`, the Rails application is initialized in development, so we have to
  # check which rake tasks are being run to determine the environment.
  #
  # See https://github.com/bkeepers/dotenv/issues/219
  #
  # source://dotenv//lib/dotenv/rails.rb#65
  def env; end

  # source://dotenv//lib/dotenv/rails.rb#21
  def files(*_arg0, **_arg1, &_arg2); end

  # source://dotenv//lib/dotenv/rails.rb#21
  def files=(arg); end

  # Public: Load dotenv
  #
  # This will get called during the `before_configuration` callback, but you
  # can manually call `Dotenv::Rails.load` if you needed it sooner.
  #
  # source://dotenv//lib/dotenv/rails.rb#43
  def load; end

  # source://dotenv//lib/dotenv/rails.rb#21
  def logger(*_arg0, **_arg1, &_arg2); end

  # source://dotenv//lib/dotenv/rails.rb#21
  def logger=(arg); end

  # source://dotenv//lib/dotenv/rails.rb#47
  def overload; end

  # source://dotenv//lib/dotenv/rails.rb#21
  def overwrite(*_arg0, **_arg1, &_arg2); end

  # source://dotenv//lib/dotenv/rails.rb#21
  def overwrite=(arg); end

  # Internal: `Rails.root` is nil in Rails 4.1 before the application is
  # initialized, so this falls back to the `RAILS_ROOT` environment variable,
  # or the current working directory.
  #
  # source://dotenv//lib/dotenv/rails.rb#55
  def root; end

  class << self
    # Rails uses `#method_missing` to delegate all class methods to the
    # instance, which means `Kernel#load` gets called here. We don't want that.
    #
    # source://dotenv//lib/dotenv/rails.rb#81
    def load; end
  end
end

# source://dotenv//lib/dotenv/rails.rb#73
Dotenv::Rails::TEST_RAKE_TASKS = T.let(T.unsafe(nil), Regexp)

# source://dotenv//lib/dotenv/rails.rb#103
Dotenv::Railtie = Dotenv::Rails

# A logger that can be used before the apps real logger is initialized.
#
# source://dotenv//lib/dotenv/replay_logger.rb#3
class Dotenv::ReplayLogger
  # @return [ReplayLogger] a new instance of ReplayLogger
  #
  # source://dotenv//lib/dotenv/replay_logger.rb#4
  def initialize; end

  # source://dotenv//lib/dotenv/replay_logger.rb#8
  def method_missing(name, *args, &block); end

  # source://dotenv//lib/dotenv/replay_logger.rb#16
  def replay(logger); end

  private

  # @return [Boolean]
  #
  # source://dotenv//lib/dotenv/replay_logger.rb#12
  def respond_to_missing?(name, include_private = T.unsafe(nil)); end
end

# An internal monitor to synchronize access to ENV in multi-threaded environments.
#
# source://dotenv//lib/dotenv.rb#11
Dotenv::SEMAPHORE = T.let(T.unsafe(nil), Monitor)

# source://dotenv//lib/dotenv/substitutions/variable.rb#4
module Dotenv::Substitutions; end

# Substitute shell commands in a value.
#
#   SHA=$(git rev-parse HEAD)
#
# source://dotenv//lib/dotenv/substitutions/command.rb#9
module Dotenv::Substitutions::Command
  class << self
    # source://dotenv//lib/dotenv/substitutions/command.rb#23
    def call(value, _env, overwrite: T.unsafe(nil)); end
  end
end

# Substitute variables in a value.
#
#   HOST=example.com
#   URL="https://$HOST"
#
# source://dotenv//lib/dotenv/substitutions/variable.rb#10
module Dotenv::Substitutions::Variable
  class << self
    # source://dotenv//lib/dotenv/substitutions/variable.rb#21
    def call(value, env, overwrite: T.unsafe(nil)); end

    private

    # source://dotenv//lib/dotenv/substitutions/variable.rb#31
    def substitute(match, variable, env); end
  end
end