import os 
import sys
from datetime import date

'''
This script is meant to scan through the old ccwsv2 logs based on root url, and will scan for logs including the provided search string.
Hopefully I never really have to use this ever again, but it does technically work... 
But I really can't endorse using it for anything serious long-term. 

'''

if len(sys.argv) < 2:
    print("You have to provide a search term. provide option 'helpme' for info")
    sys.exit(1)
if sys.argv[1] == 'helpme' or sys.argv[1] == 'help':
    print("Pulls logs from the 4 staging servers running CCWS.\nAssumes working ssh access to all servers.")
    print('Param 1: search string. Param 2: custom date (default is today) in format mm.dd.yyyy')
    print('(dont forget to enclose params in quotes if there are spaces)')
    sys.exit(0)

search_target = sys.argv[1]
today = date.today()
formatted_today = today.strftime('%m.%d.%Y')
if len(sys.argv) > 2: # allow passed in date
    formatted_today = sys.argv[2]

#print(search_target)
#print(today)
#print(formatted_today)

print('************** Beginning Log Pull For Provided Term "'+search_target+'" ************')
print('***********************************************************************************')
#for s in `seq 301 304` ; do ssh alex.bates@ccws-$s.staging.clearcaptions.com grep -A2 -B2 'michael' /var/www/vhosts/webservices/logs/ccws.06.11.2021.log  ; done

final_output = ''

for i in [301,302,303,304]:
    server_name = 'ccws-{server_name}.staging.clearcaptions.com'.format(server_name=i)
    
    print('Log Section for {server_name}:'.format(server_name = server_name))
    output = os.popen('ssh alex.bates@{server_name} zgrep -A2 -B2 {search_target} /var/www/vhosts/webservices/logs/ccws.{format_time}.log'.format(server_name = server_name, search_target=search_target, format_time = formatted_today))
    final_output += output.read() + '\n'

    print("/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/")


print(final_output)
print('\n***********************************************************************************\n')

