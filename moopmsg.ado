
program moopmsg 
	version 16.0
	syntax anything(name=token id="Telegram bot token") , msg(string) [file(string)]
	qui: python search
	python: send_to_telegram("`msg'" , "`token'", "`file'")
end



python 

import requests
import json
from sfi import SFIToolkit
import __main__

def send_to_telegram(message, token, file):
	apiToken = token
	apiURLc = f'https://api.telegram.org/bot{apiToken}/getUpdates'
	apiURLm = f'https://api.telegram.org/bot{apiToken}/sendMessage'
	apiURLs = f'https://api.telegram.org/bot{apiToken}/sendDocument'
	
	
	
	try:
		r=requests.get(apiURLc)
		chatID=r.json()
		chatID=chatID['result'][0]['message']['chat']['id']
		print("Succesfully connected to bot")
		
	except Exception as e:
		print("ChatID Error")
		print(e) 
		SFIToolkit.errprint("Verify that token is correctly specified. If it is, it then it is possible that your bot went dormant. Try sending it a message on Telegram to wake it up ")
		SFIToolkit.exit(499)
		
	try:
		response = requests.post(apiURLm, json={'chat_id': chatID, 'text': message})
		print("Message Sent")
	except Exception as e:
		print("Message Error")
		print(e)
		SFIToolkit.exit(499)
		
	if file:
		try: 
			print(file)
			fPath = file
			params = { 'chat_id': chatID, }
			files = { 'document': open(fPath, 'rb'),  }
			resp = requests.post(apiURLs, params=params, files=files)
			print("File Sent")
		except Exception as e:
			print("File Error")
			print(e)
			SFIToolkit.exit(499)
	else:
		pass  
end



