# Usage
./r3k-ffmpeg.sh input.avi h263p 100

./r3k-sox.sh input.wav vorbis 33.1k 20

./r3k-img.sh input.png bmp msmpeg4v3 5 150

# oWo???
Finally no more tedious re-uploads to hosting services.
Basically we're just re-encoding the output several hundred times over until it squeezes the succulent glitch juices out.

You can probably use this with any command line program as far as I know, I inluded a SoX sample for your listening pleasure.
The ffmpeg sample has the -t 5 flag at the beginning to cut the input to 5 seconds for a quick example, remove when you like. I also added -an to remove audio in the example, to speed up the process.
 
Also note when using r3k-img.sh, if you use other containers like bmp, ppm, xwd, etc; the artifacts are much different. That also includes the colorspace the container is using. (bgr24 in bmp)
Don't forget to experiment the video/image quality.
