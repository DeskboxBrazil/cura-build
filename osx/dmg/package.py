filename = 'dist/Deskbox.dmg'
volume_name = 'Deskbox'
badge_icon = '/vagrant/Cura.icns'
size = '150m'
# Symlinks to create
files = [ 'dist/Deskbox.app' ]
symlinks = { 'Applications': '/Applications' }
# Window position in ((x, y), (w, h)) format
window_rect = ((635, 400), (650, 500))
icon_locations = {
    'Deskbox.app': (200, 350),
    'Applications': (450, 350)
}
background = '/vagrant/osx/dmg/background.png'
icon_size = 64
