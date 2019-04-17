# Dell Generation 11 IPMI control by muhuyama

I made this program to turn down my r410 fans a tad (from 13K rpm to 2.4k rpm), and evolved it from there. I received this server a few days ago, and this is my first time coding in IPMI, my first batch file, the first time I have used cmd for anything not EXTREMELY basic, and my first time using github. It has only been tested on my r410. So be prepared for issues. It should work just fine though, but I take absolutely no responsibility for any issues it may cause. 

# Prerequisites
- You will need to enter iDRAC, go to iDRAC settings on the far left, go to network & security on the top bar, and scroll down to "IPMI Settings" (ctrl + f will work), then tick "Enable IPMI over LAN"
- You will need to download and install this https://www.dell.com/support/home/us/en/04/drivers/driversdetails?driverid=9ngfj on any systems that you would like to control your server from
- You will need to run my batch file, and enter the server IP, username and password (should be the same as iDRAC)
- Feel free to message me about any issues, or to request features.

If you would like to pass on this script, please give them a link to this github. Good luck!
