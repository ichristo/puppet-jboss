$executing_puppet = true

require 'spec_helper'

at_exit { RSpec::Puppet::Coverage.report! }
