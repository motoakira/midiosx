require 'mkmf'

$CFLAGS << ' -Wall -Werror -O3 '
$LDFLAGS = '-framework AudioToolbox -framework CoreMIDI -framework AudioUnit'

extname = 'midiosx'

dir_config(extname)
create_makefile(extname)
