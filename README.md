# Mac tells you what to do and helps you stay in shape

Mac script forked from old repo and made some improvements.

Every hour between 10-20:00 it:

- stores the current volume and mute settings
- fades in music
- TELLS you what to do - this is the important part :)
- fades out music
- resets volume to initial settings

Here is a post with an mp3 example of how it sounds in action
https://apsion.com/have-your-mac-tell-you-what-to-do-and-improve-your-health/

To execute every hour between 10-20:00 10AM/8PM
Want to setup your own schedule http://corntab.com/ is very useful

> crontab -e

Then add the following line to cron

> \*/60 10-20 \* \* \* sh sh <directoryToYourFile/pushups.sh>

Finally, if you want it to play music, edit the pushups script and replace the path using your own mp3.
Note: Keep the & following the mp3 path
