@echo off
cd /d %~dp0

for %%f in (%*) do (

  echo %%f
  
  if not "%%~xf" == ".m3u8" (
    echo "Only m3u8 is available."
    goto END
  )

  ffmpeg -i %%f -movflags faststart -c copy -bsf:a aac_adtstoasc "./%%~nf.mp4"

  echo %%~nf.mp4
)

:END

pause
