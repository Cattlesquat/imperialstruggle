:: Makes add-to-deck versions of treachery cards

:: Start with "CardSlot.png" for each one
del y-*.png
for %%I in ( Card-*.png ) do copy ..\..\CardSlot.png y-%%I 

:: Start with "Button-NewPlan.png" for each one
del hery-*.png
for %%I in ( Card-*.png ) do copy ..\..\Button-NewPlan.png hery-%%I 

:: Make a scaled down copy of image
del ry-*.png
for %%I in ( Card-*.png ) do magick convert "%%I" -resize 85%% -set filename: "ry-%%t" "%%[filename:].png"

:: Make a chopped-off version
del ery-*.png
for %%I in ( ry-*.png ) do magick convert "%%I" -gravity north -crop 100x55%% +repage -set filename: "e%%t" "%%[filename:].png" 

:: Stamp the chopped off card onto the starting template
del chery-*.png
for %%I in ( y-*.png ) do magick convert -composite -gravity north -geometry +0+26 "%%I" "er%%I" -set filename: "cher%%t" "%%[filename:].png"

:: Stamp the button on top
del Treachery-*.png
for %%I in ( y-*.png ) do magick convert -composite -gravity center -geometry +0+126 "cher%%I" "her%%I" -set filename: "Treacher%%I" "%%[filename:]"

:: Clean up
del y-*.png
del ry-*.png
del ery-*.png
del hery-*.png
del chery-*.png

:: Put a copy of this BAT file in the module (and therefore git tree) for backup/archive
copy maketreach.bat c:\projects\inferno\module






