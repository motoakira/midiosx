require 'mkmf'

$CFLAGS << ' -Wall -Werror -O3 '
$LDFLAGS = '-framework AudioToolbox -framework CoreMIDI -framework AudioUnit'

extname = 'music_player'

dir_config(extname)
create_makefile(extname)
