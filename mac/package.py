filename = 'Deskbox.dmg'
volume_name = 'Deskbox'
badge_icon = 'cura-build/Cura.icns'
size = '150m'
# Symlinks to create
files = [ '../build/dist/Cura.app' ]
symlinks = { 'Applications': '/Applications' }
# Window position in ((x, y), (w, h)) format
window_rect = ((635, 400), (650, 500))
icon_locations = {
    'Cura.app': (200, 350),
    'Applications': (450, 350)
}
background = 'background.png'
icon_size = 64
