
:: Crop the Art of War card faces to be the same size as all the other card parts
del d-AW-Guelph*.jpg
for %%I in ( AW-Guelph*.jpg ) do magick convert "%%I" -crop 375x525+2+1 -set filename: "d-%%t" "%%[filename:].jpg"

del d-AW-Ghib*.jpg
for %%I in ( AW-Ghib*.jpg ) do magick convert "%%I" -crop 375x525+2+1 -set filename: "d-%%t" "%%[filename:].jpg"

:: The rest of the cards are already the right size, so just move them into position
for %%I in ( CC-*.jpg ) do copy %%I d-%%I
copy AW-GOLD-BACK.jpg d-AW-GOLD-BACK.jpg
copy AW-PURPLE-BACK.jpg d-AW-PURPLE-BACK.jpg

:: Stamp the card template over top of everything
del ard-*.png
for %%I in ( d-*.jpg ) do magick convert -composite -gravity center "%%I" template.png -set filename: "ar%%t" "%%[filename:].png"

:: Make the corners transparent
del Card-*.png
for %%I in ( ard-*.png ) do magick convert "%%I" -transparent "rgb(163,73,164)" -set filename: "C%%t" "%%[filename:].png"

:: Make the "half-cards" images
for %%I in ( Card-AW-*.png ) do magick convert "%%I" -alpha on -channel A -fx "j>h/2?a:0" -set filename: "%%t-Half" "%%[filename:].png"
del Card-AW-GOLD-BACK-Half.png
del Card-AW-PURPLE-BACK-Half.png

:: Copy to the cards directory
copy Card-*.png ..\Cards

:: Clean up
del d-*.jpg
del ard-*.png
del Card-*.png

:: Put a copy of this BAT file in the module (and therefore git tree) for backup/archive
copy makecards.bat c:\projects\inferno\module

:: Done!



