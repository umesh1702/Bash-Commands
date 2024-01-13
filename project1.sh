#!/usr/bin/bash
cd 
ls
echo "creating and moving to the directory ProjectData...."
if [ -d ProjectData ]; then
   ls
   cd ProjectData
   echo "moved to the directory ProjectData"
else
   mkdir ProjectData
   ls
   cd ProjectData
   echo "created and moved to directory ProjectData"
fi

#creating the sub directories in the directory if it exist we move to one of that dictonary
echo "creating sub directories...."
if [ ! -d Report ]; then
  mkdir Report
  echo "created Report sub directory."
fi
  if [ ! -d Logs ]; then
  mkdir Logs
  echo "created Logs sub directory."
fi
if [ ! -d Data ]; then
  mkdir Data
  ls
  cd Data
  echo "created and moved to sub directory Data"
 
else
  
  ls
  cd Data
  echo "moved to directory Data " 
fi
#now we create a txt file of 10 in number by using for loop
echo "creating a 10 text file in data directory....."
if [ ! -e file1.txt ]; then
  for i in {1..10}
  do
  
   touch file$i.txt
  done
else 
   for i in {1..10}
  do
   rm file$i.txt
   touch file$i.txt
  done

fi
ls
#we write some text into each of the newly created text files
echo "writing the text into each file created in data directory...."
for ((i=1;i<=10;i++))
  do
    for((j=1;j<=i;j++))
     do
       echo "Hello world.i am in file$i" >> file$i.txt
     done
  done

#now we  check what is printed into each text file
echo "printing what is written in the text file...."
for i in {1..10}
  do
    echo "contents in file$i.txt"
    cat file$i.txt
  done

cd ..
echo "creating a file in the report directory..."
cd Report
#we create a summary.txt file in Report folder
if [ ! -e summary.txt ]; then
  touch summary.txt
else 
  rm summary.txt
  touch summary.txt
fi
ls
# now we copy the no of lines in each file to summary.txt file. To view the no of line we use wc -l
echo "appending the summary.txt with no of lines in each file... " 
cd ..
cd Data
for i in {1..10}
 do
  echo "no of lines in file$i.txt is $(wc -l  file$i.txt)" >> ~/ProjectData/Report/summary.txt
 done
 cat ~/ProjectData/Report/summary.txt
# we create a log.txt file to store the logs
echo "creating the log.txt in logs directory.."
if [ -e log.txt ]; then 
  touch log.txt
fi

echo "This script was run by you on  $(date)" >> ~/ProjectData/Logs/log.txt

cat ~/ProjectData/Logs/log.txt

