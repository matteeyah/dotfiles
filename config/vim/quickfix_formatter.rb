# frozen_string_literal: true

# Format rspec output for vim quickfix
class QuickfixFormatter
  RSpec::Core::Formatters.register self, :example_failed

  def initialize(output)
    # no-op
  end

  def example_failed(notification)
    warn(format_failure(notification))
  end

  private

  def format_failure(notification)
    format('%<location>s: %<message>s',
           location: notification.example.location,
           message: notification.exception.message).tr("\n", ' ')
  end
end
