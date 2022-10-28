{smcl}
version: 1.0.0 


{title:moopmsg}

{p 4 4 2}
This is a program that will message you from your Telegram bot. It can send any string message and small files to your Telegram. You will need to make a bot and supply the API token from Telegram   {break}

{title:Requirements}

{p 4 4 2}
You need to have at least Stata 16 and python installed on your machine. 
To ensure that Stata can find your local python installation you can run "python search" to check. 
Moopmsg will also check for the python installation {break}


{title:Syntax}

{p 8 8 2} moopmsg {it:token} , msg("string") file("filepath") {break}
{space 1} {break}
msg() is required. file() is optional

{title:Setting up your Telegram bot}

{p 4 4 2}
Telegram is a messaging application with an easy to use and open API. You can use it on your desktop, web browser, or as a mobile app. 
If you do not have a Telegram account, you can download the mobile app and provide a valid phone number to start one.  
To get a bot you must start a conversation with the bot father. {it: @BotFather or https://telegram.me/botfather} 
Send "/newbot" and you will be prompted for a name. This can be whatever you would like, as long it is not taken. {break}
{it: Note that the bot name must end with the word 'bot'} {break}
{space 1} {break}
The BotFather will provide you with a token. This is your access to the bot. You need to provide this to moopmsg. 

{title:Example}

{p 4 4 2}
I would suggest declaring your API token as a global early in the do file to keep things neat {break}
{space 1} {break}
{space 4} global token "1234567890:examplepretendapi_t0ken" {break}
{space 1} {break}
You can then send your message or file with 

    . moopmsg $token, msg("this is a test message without an image or file") 
    . moopmsg $token, msg("this is a test message with an image or file")  file("D:/example.tsv")


{title:Author}

{p 4 4 2}
Justin Mohr {break}
Gies College of Business {break}
University of Illinois at Urbana-Champaign {break}
{it:mohr6@illinois.edu}

{space 4}{hline}

