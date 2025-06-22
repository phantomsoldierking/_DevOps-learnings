# File and Directory Management

mkdir -p /var/logs/myapp
touch /var/logs/myapp/app.log
echo "Log initialized" >> /var/logs/myapp/app.log


# Process Management
#!/bin/bash
process="nginx"
if pgrep -x "$process" > /dev/null; then
    echo "$process is running"
else
    echo "$process is not running, starting it now..."
    systemctl start nginx
fi


# Network Management    
#!/bin/bash
ping -c 1 google.com > /dev/null
if [ $? -eq 0 ]; then
    echo "Internet is up"
else
    echo "Internet is down"
fi

# Log Management
#!/bin/bash 
log_file="/var/logs/myapp/app.log"
if [ -f "$log_file" ]; then
    echo "Log file exists"
else
    echo "Log file does not exist"
fi

# User Management
#!/bin/bash
user="devops"
if id "$user" &>/dev/null; then
    echo "User exists"
else
    echo "User does not exist"
fi

# Package Management
#!/bin/bash
package="nginx"
if dpkg -l | grep -q "$package"; then
    echo "$package is installed"
else
    echo "$package is not installed"
fi

# System Information
#!/bin/bash
echo "Hostname: $(hostname)"
echo "IP Address: $(hostname -I)"
echo "CPU Usage: $(top -bn1 | grep "Cpu(s)" | sed "s/.*, *\([0-9.]*\)%* id.*/\1/" | awk '{print 100 - $1"%"}')"
echo "Memory Usage: $(free | grep Mem | awk '{print $3/$2 * 100.0}')%"
echo "Disk Usage: $(df -h / | awk '{print $5}' | sed 's/%//g')"
echo "Uptime: $(uptime | awk '{print $3" "$4}' | sed 's/,//g')"
echo "Processes: $(ps aux | wc -l)"
echo "Users: $(users | wc -w)"

