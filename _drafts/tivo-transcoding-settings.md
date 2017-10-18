
Having never transcoded a video before, I chose [HandBrake](https://handbrake.fr/) because the internet
seemed to agree that it was EasyMode<sup>TM</sup>. Since I was most likely going
to watch the same clip way too many times while I tweaked the settings, I selected
something that one can never get tired of watching: Twister. Choose wisely, is all I'm saying.

So I carefully followed the [Plex doc](https://support.plex.tv/hc/en-us/articles/203810286-What-media-formats-are-supported-)
to choose transcoding settings that my Tivo Plex client supported:

* MKV format
* 1080p @ 30 FPS
* 5.1 channel surround audio using AAC and optionally A3C with pass-through
* Optional English subtitles

At first glance, the dizzying array of toggles and switches available in HandBrake
are overwhelming. So I headed straight for the presets and tried a few rips using the
"slow", "very slow" and "audiophiles couldn't tell the difference" presets. I used
to pride myself on not giving a fuck about pixels, FPS, 5.1 channel *mumble mumble*
but if I was going to go through all this trouble, I wasn't about to half-ass it.

![Ron Swanson: Never half-ass two things, whole ass one thing](/images/handbrk8s/whole-ass.jpg)

I settled on "HQ 1080p30 Surround" which means 1080p at max 30 FPS with 5.1 AAC and A3C audio tracks.
But I couldn't stop there because I love closed captions. This ... took more time
than I care to admit. Here is the magic sauce:

![Screen shot of the HandBrake GUI's subtitles tab](/images/handbrk8s/subtitle-defaults.png)

In order to not lose my tweaks each time I opened a DVD, I made a copy of my preferred
preset and then used "Configure Defaults" to setup the default subtitle behavior:

* Foreign Audio Search: ✓ Forced Only, ✓ Burned In. This means that when the movie is in English
but the subtitles are in another language, always show these subtitles. This way when Jabba the Hut
is speaking, his English subtitles always show up automagically.
* English Subtitles: Do not force, do not burn in. This saves the English subtitles
with the video, turned off by default. When you are watching the video, you can decide to
turn them on.

I left pretty much everything else alone, which [in hindsight wasn't the right thing to do](#).
But for now, the video played, I could turn on subtitles and it didn't look like a hot turd.
Huzzah!

✅ Transcode a video<br/>
✅ Support optional subtitles

Weekend accomplished!

Next Up: [Challenge #2: Automate or GTFO](#challenge-2-automate-or-gtfo)
