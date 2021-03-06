# What do I need, b0ss?!

```sudo apt-get install ffmpeg```

```sudo apt-get install sox```

```https://github.com/atagen/chexr```

# Usage
./r3k-ffmpeg.sh input.avi h263p 100

./r3k-sox.sh input.wav vorbis 33.1k 20

./r3k-img.sh input.png bmp msmpeg4v3 bgr24 5 150

./r3k-img-chexr.sh input.png bmp libtheora bgr24 100 50 0111 0109

./r3k-ffmpeg-vf.sh input.png bmp bgr24 0 30 erosion 6 hqdn3d 100

./r3k-ffmpeg-af.sh input.mp3 wav 0 5 atempo 0.5 atempo 1.50

./r3k-acodec-chexr.sh input.mp3 avi wmav1 15 0 10 0003 0099

# oWo???
Finally no more tedious re-uploads to hosting services.
Basically we're just re-encoding the output several hundred times over until it squeezes the succulent glitch juices out.

You can probably use this with any command line program as far as I know, I inluded a SoX sample for your listening pleasure.
The ffmpeg sample has the -t 5 flag at the beginning to cut the input to 5 seconds for a quick example, remove when you like. I also added -an to remove audio in the example, to speed up the process.
 
Also note when using r3k-img.sh, if you use other containers like bmp, ppm, xwd, etc; the artifacts are much different. That also includes the colorspace the container is using. (bgr24 in bmp)


Don't forget to tinker with the video/image quality.

# !!!
But wait, there's more! 

r3k-img-chexr is pretty much the same as r3k-img.sh but with hex replacement and a lot more organized.

r3k-ffmpeg-vf takes a different approach by applying video filters numerous times to a single image.

r3k-ffmpeg-af is the same as the above script but with audio effects. You can also adjust the audio quality when working with lossy formats.

r3k-acodec-chexr.sh is a mod of r3k-img-chexr. The variable order goes as such: input, container format (nut or avi), acodec, input duration, audio quality, amount of times to process, hex target, hex replacement (replace 0099 with 0066)

When working with the video filter and audio filter scripts, you can adjust filter settings by separating the parameters listed with "ffmpeg -h filter=filtername" like so:

./r3k-ffmpeg-af.sh input.mp3 wav 0 25 compand 0.3:0.8:-70/-70:900:0:0:3 compand 0.3:0.8:-70/-70:900:0:0:3

./r3k-ffmpeg-vf.sh input.png bmp bgr24 0 100 erosion threshold0=1:threshold1=1:threshold2=1:threshold3=1:coordinates=5 atadenoise 0a=0.3:0b=5:1a=0.3:1b=5:2a=0.35:2b=5:s=5:p=7
