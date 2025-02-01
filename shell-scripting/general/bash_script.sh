#!/bin/bash  # Shebang (tells the system to use Bash)

echo "Hello, DevOps!"

# chmod +x script.sh
# ./script.sh


name="DevOps Engineer"
echo "Hello, $name"

echo "Enter your name:"
read user_name
echo "Hello, $user_name!"

count=5
if [ "$count" -gt 3 ]; then
    echo "Count is greater than 3"
else
    echo "Count is 3 or less"
fi

for i in {1..5}; do
    echo "Iteration $i"
done


counter=1
while [ $counter -le 5 ]; do
    echo "Counter: $counter"
    ((counter++))
done
