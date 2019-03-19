# Pushups

Modified Mac script that will remind you to do pushups every hour.
Originally from
Tindr, we use it to stay awake and keep the blood pumping!
http://tindr.co/automated-coach-to-let-your-employees-exercise-in-your-office

Now at Apsion!

To execute every hour between 10-20:00 10AM/8PM

> crontab -e

And then add the following line:

> _/60 10-20 _ \* \* sh sh /directoryToYourFile/pushups.sh

Finally, if you want it to play music, edit the pushups.sh file to point to the mp3 of your choice.
Note: Keep the & after the mp3 path
