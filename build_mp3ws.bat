armips mp3ws.s
mpromtool -a mp3_temprom.z64 mp3_extract
xcopy "new_files" "mp3_extract" /S /E /Y
mpromtool -b -a mp3_temprom.z64 mp3_extract mp3ws.z64
rmdir /s /q mp3_extract
del mp3_temprom.z64