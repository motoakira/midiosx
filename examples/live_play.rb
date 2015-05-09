require 'music_player'

class LivePlay
  include AudioToolbox
  
  def initialize
    @player   = MusicPlayer.new
    @sequence = MusicSequence.new
    @track    = @sequence.tracks.new
    @sequence.auGraph.open.init.start
    @track.play(MIDIProgramChangeMessage.new(:channel => 1, :program => 62))
    @player.sequence = @sequence
  end
  
  def note_on(note)
    @track.play(MIDINoteOnMessage.new(:note     => note,
                          :velocity => 80,
                          :channel  => 1))
  end

  def note_off(note)
    @track.play(MIDINoteOffMessage.new(:note     => note,
                          :release_velocity => 80,
                          :channel  => 1))
  end

NOTES = [
    [68, 1], [68, 1], [69, 1], [71, 1],
    [71, 1], [69, 1], [68, 1], [66, 1],
    [64, 1], [64, 1], [66, 1], [68, 1],
    [68, 1.5], [66, 0.5], [66, 1],
    
    [68, 1], [68, 1], [69, 1], [71, 1],
    [71, 1], [69, 1], [68, 1], [66, 1],
    [64, 1], [64, 1], [66, 1], [68, 1],
    [66, 1.5], [64, 0.5], [64, 1]
]

    def note_conv(c)
        note = NOTES.fetch(c)
    end

  def run
    NOTES.each do |pair|
        note, dur = pair
        note_on(note)
        sleep(dur)
        note_off(note)
    end
    @sequence.auGraph.stop
  end
end

LivePlay.new.run
