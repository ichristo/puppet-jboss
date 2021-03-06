require File.expand_path(File.join(File.dirname(__FILE__), '../puppet_x/coi/jboss/configuration'))

config = Puppet_X::Coi::Jboss::Configuration::read
unless config.nil?
  config.each do |key, value|
    fact_symbol = "jboss_#{key}".to_sym
    Facter.add(fact_symbol) do
      setcode { value }
    end
  end
  Facter.add(:jboss_fullconfig) do
    setcode do
      if RUBY_VERSION < '1.9.0'
        class << config
          define_method(:to_s, proc { self.inspect })
        end
      end
      config
    end
  end
end
