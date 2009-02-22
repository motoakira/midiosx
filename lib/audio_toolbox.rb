$:.unshift File.join(File.dirname(__FILE__), '../ext')
require 'music_player.bundle'

module AudioToolbox
  
  class MIDIChannelMessage
    def channel
      status ^ mask
    end
    
    def mask
      raise NotImplementedError, "Subclass responsibility."
    end
    
    protected
      def required_opts(opts, *keys)
        keys.map do |key|
          opts[key] or raise ArgumentError, "%s is required." % key.inspect
        end
      end
  end
  
  class MIDIKeyPressureMessage < MIDIChannelMessage
    alias :note :data1
    alias :pressure :data2
    
    def mask; 0xA0 end
    
    def initialize(opts)
      channel, note, pressure = required_opts(opts, :channel, :note, :pressure)
      super(:status => mask | channel,
            :data1  => note,
            :data2  => pressure)
    end
  end
  
  class MIDIControlChangeMessage < MIDIChannelMessage
    alias :number :data1
    alias :value :data2
    
    def mask; 0xB0 end
    
    def initialize(opts)
      channel, number, value = required_opts(opts, :channel, :number, :value)
      super(:status => mask | channel,
            :data1  => number,
            :data2  => value)
    end
  end
  
  class MIDIProgramChangeMessage < MIDIChannelMessage
    alias :program :data1
    
    def mask; 0xC0 end
    
    def initialize(opts)
      channel, program = required_opts(opts, :channel, :program)
      super(:status => mask | channel,
            :data1  => program)
    end
  end
  
  class MIDIChannelPressureMessage < MIDIChannelMessage
    alias :pressure :data1
    
    def mask; 0xD0 end
    
    def initialize(opts)
      channel, pressure = required_opts(opts, :channel, :pressure)
      super(:status => mask | channel,
            :data1  => pressure)
    end
  end
  
  class MIDIPitchBendMessage < MIDIChannelMessage
    alias :value :data1
    
    def mask; 0xE0 end
    
    def initialize(opts)
      channel, value = required_opts(opts, :channel, :value)
      super(:status => mask | channel,
            :data1  => value)
    end
  end
end