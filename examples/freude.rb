require 'midiosx'

class Freude
  include AudioToolbox
  
  def initialize
    @player   = MusicPlayer.new
    @sequence = MusicSequence.new
    @track    = @sequence.tracks.new
    @track.add(0.0, MIDIProgramChangeMessage.new(:channel => 1, :program => 62))
    # Use the following call sequence to use an alternate midi destination.
    # Hopefully a more complete interface will be implemented soon. MIDI
    # destinations are referenced by their index beginning at 0.
    # See also CoreMIDI::get_number_of_destinations().
    # 
    # @sequence.midi_endpoint = CoreMIDI.get_destination(ARGV.shift.to_i)
    @player.sequence = @sequence
    build_track
  end
  
  def note_play(beat, note, duration)
    @track.add(beat,
      MIDINoteMessage.new(:note     => note,
                          :velocity => 80,
                          :channel  => 1,
                          :duration => duration))
    beat + duration
  end
  
  def build_track
    timing = 0.0
    timing = note_play(timing, 68, 1)
    timing = note_play(timing, 68, 1)
    timing = note_play(timing, 69, 1)
    timing = note_play(timing, 71, 1)
    timing = note_play(timing, 71, 1)
    timing = note_play(timing, 69, 1)
    timing = note_play(timing, 68, 1)
    timing = note_play(timing, 66, 1)
    timing = note_play(timing, 64, 1)
    timing = note_play(timing, 64, 1)
    timing = note_play(timing, 66, 1)
    timing = note_play(timing, 68, 1)
    timing = note_play(timing, 68, 1.5)
    timing = note_play(timing, 66, 0.5)
    timing = note_play(timing, 66, 1)

    timing = note_play(timing, 68, 1)
    timing = note_play(timing, 68, 1)
    timing = note_play(timing, 69, 1)
    timing = note_play(timing, 71, 1)
    timing = note_play(timing, 71, 1)
    timing = note_play(timing, 69, 1)
    timing = note_play(timing, 68, 1)
    timing = note_play(timing, 66, 1)
    timing = note_play(timing, 64, 1)
    timing = note_play(timing, 64, 1)
    timing = note_play(timing, 66, 1)
    timing = note_play(timing, 68, 1)
    timing = note_play(timing, 66, 1.5)
    timing = note_play(timing, 64, 0.5)
    timing = note_play(timing, 64, 1)

    @track.length = timing + 8 # some rest between iterations
    @track.loop_info = { :duration => @track.length, :number => 0 }
  end
  
  def run
    @player.start
    puts "Press return to exit."
    gets
    @player.stop
  end
end

Freude.new.run
