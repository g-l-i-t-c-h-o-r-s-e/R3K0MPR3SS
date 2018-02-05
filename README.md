# What do I need, b0ss?!

```sudo apt-get install ffmpeg```

```sudo apt-get install sox```

```https://github.com/atagen/chexr```

# Usage
./r3k-ffmpeg.sh input.avi h263p 100

./r3k-sox.sh input.wav vorbis 33.1k 20

./r3k-img.sh input.png bmp msmpeg4v3 bgr24 5 150

./r3k-img-chexr.sh input.png bmp libtheora bgr24 100 50 0111 0109

./r3k-ffmpeg-vf.sh input.png bmp 0 30 erosion 6 hqdn3d 100

./r3k-ffmpeg-af.sh input.mp3 wav 0 5 atempo 0.5 atempo 1.50

# oWo???
Finally no more tedious re-uploads to hosting services.
Basically we're just re-encoding the output several hundred times over until it squeezes the succulent glitch juices out.

You can probably use this with any command line program as far as I know, I inluded a SoX sample for your listening pleasure.
The ffmpeg sample has the -t 5 flag at the beginning to cut the input to 5 seconds for a quick example, remove when you like. I also added -an to remove audio in the example, to speed up the process.
 
Also note when using r3k-img.sh, if you use other containers like bmp, ppm, xwd, etc; the artifacts are much different. That also includes the colorspace the container is using. (bgr24 in bmp)


Don't forget to tinker with the video/image quality.

# ? 
But wait, there's more! 

r3k-img-chexr is pretty much the same as r3k-img.sh but with hex replacement.

r3k-ffmpeg-vf takes a different approach by applying video filters numerous times to a single image.

r3k-ffmpeg-af is the same as the above script but with audio effects. You can also adjust the audio quality when working with lossy formats.
