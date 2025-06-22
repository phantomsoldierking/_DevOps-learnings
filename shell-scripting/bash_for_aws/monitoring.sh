#  Disk Space Monitoring

#!/bin/bash
THRESHOLD=80
USAGE=$(df / | tail -1 | awk '{print $5}' | sed 's/%//')

if [ $USAGE -gt $THRESHOLD ]; then
    echo "Disk space critical: $USAGE% used!" | mail -s "Disk Alert" admin@example.com
fi


# Server Health Check
#!/bin/bash
ping -c 3 google.com > /dev/null
if [ $? -ne 0 ]; then
    echo "Internet is down!"
fi


