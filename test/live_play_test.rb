#
#  live_play_test.rb
#  
#
#  Created by 進藤 元明 on 2015/01/28.
#  Copyright 2015年 __MyCompanyName__. All rights reserved.
#


class LivePlayTest < Test::Unit::TestCase
    def setup
        @sequence = MusicSequence.new
        @track = @sequence.tracks.new
        @player = MusicPlayer.new
    end

    def test_auGraph
        assert_kind_of(AUGraph, @sequence.auGraph)
    end

    def test_play
        @sequence.auGraph.open.init.start
        synth = nil
        assert_nothing_raised {
            synth = (@track.play MIDINoteOnMessage.new(:channel => 1, :note => 60, :velocity => 80))
        }
        assert_kind_of(AudioUnit, synth)
        sleep(3);
        assert_nothing_raised {
            synth = (@track.play MIDINoteOffMessage.new(:channel => 1, :note => 60, :release_velocity => 0))
        }
        @sequence.auGraph.stop
    end

end