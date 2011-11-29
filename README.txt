AHIGS Festival of Speech result tracker and calculator
======================================================

OVERVIEW


When given a hand-completed slip that says

   Event: Current Affairs
   Results:
     1. Frensham
     2. Danebank
     3. PLC Sydney

I want to be able to record something like the following in a file [1]

   - Current Affairs
     - Frensham
     - Danebank
     - PLC Sydney

and run a program -- ahigs.rb -- that reads all input files and generates a
complete report of all results (including points obtained) and a points list for
all schools.

[1] There could be one file for each event or, more likely, there would be
"debating.events" and "other.events".  The contents may need to be more
structured than this but they should be simple and human-readable (for
double-checking)



REPORTING


The report would be completely comprehensive so that it can be scrutinised.  It
would contain:
 * A complete description of the configuration: what events are being tracked,
   and how many points are awarded for first, second, third.
 * Each event: who came first, second, third, and how many points they got for
   doing so.
 * Each school: what achievements they have made, and what points they got for
   each one, and of course the total points.
 * An overall point score, listing all schools in descending order of points.
 * A list of outstanding events.

The report could be generated in text AND html AND (perhaps) PDF.  When a report
is generated, two copies are made:
  Dropbox/AHIGS/report.txt
  Dropbox/AHIGS/reports/2011-08-30/report-1432.txt

In this way, it's easy to examine the current report, and all previous reports
can be examined as well.

When the report is being generated, a lot of information is printed to STDOUT
and/or a log file, so that I can clearly see:
 * what files are being read
 * what events are being calculated
 * error messages for mistyped events or schools



CONFIGURATION


To configure this, there are two things to consider:
 * The code lives in its project directory, backed up to github.
 * The live data lives in the data directory, backed up to Dropbox [2]

The code is run from a Cygwin window (or perhaps a very simple GUI), so it
should read a very simple configuration file, telling it where the data
directory is.

Inside the data directory, the configuration is year-specific, so it could look
for a file like 2011.conf.  This would contain:
 * A list of events, how many places are awarded points, and what those points
   are. [3]
 * A list of schools participating.

Also in the data directory, of course, are the "events" files.  These can be
read in any order, but the report should use the configured event list to
determine the output order.

[2] It's probably not worth having the data directory IN dropbox, as suggested
above, because lots of files are being generated, so Dropbox would be kept very
busy.  Perhaps an occasional semiautomatic backup is better.

[3] Debating may be more complicated; I don't remember.  If so, some
debating-specific knowledge could be coded or configured.



DATA ENTRY


The data is simply text.  The program is flexible enough to read all ".event"
files, so it's up to the operator how many files to maintain.  They should be
periodically backed up as a guard against accidental overwriting.  BUT... there
is always the handwritten submissions to check against.  Nonetheless, some
backup is a good idea.  It could be automatic by the reporting program; it could
be manual or semiautomatic using a separate command; it could use a local git
repository or it could just make a timestamped copy of event files to a backup
directory.

The reports generated will contain enough information to check the data entry
and recreate any damaged ".event" files.


EXAMPLE OF CONFIGURATION

  
  Events:
   - Current Affairs: [5,4,3]
   - Religious & Ethical Questions: [5,4,3]
   - Poetry Readings: [3,2,1]
   - ...
  Schools:
   - Danebank
   - PLC
   - PLC Sydney
   - ...



OTHER STUFF

I think there may be other points to consider: participation, getting to the
next round of debating, ...  Need to find out.

Participation earns one point, I think, so each event needs to record who
participated.  This could potentially be done on an inclusion or an exclusion
basis.



