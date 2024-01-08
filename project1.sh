#!/usr/bin/bash
# creating the main directory if it already exist we just move to that directory
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
if [ -d Report ] || [ -d Logs] || [ -d Data]; then
  ls
  cd Data
  echo "moved to directory Data "
else
  mkdir Report
  mkdir Logs
  mkdir Data
  ls
  cd Data
  echo "created and moved to sub directory Data"
fi
#now we create a txt file of 10 in number by using for loop
echo "creating a 10 text file in data directory....."
if [ ! -e file1.txt ]; then
  for i in {1..10}
  do
   touch file$i.txt
  done
fi
#we write some text into each of the newly created text files
echo "writing the text into each file created in data directory...."
for i in {1..10}
  do
    echo "Hello world. i am in file$i" > file$i.txt
  done
ls
#now we  check what is printed into each text file
echo "printing what is written in the text file...."
for i in {1..10}
  do
    cat file$i.txt
done

cd ..
echo "creating a file in the report directory..."
cd Report
#we create a summary.txt file in Report folder
if [ -e summary.txt ]; then
  touch summary.txt
fi
ls
cd ..
cd Data
# now we copy the no of lines in each file to summary.txt file. To view the no of line we use wc -l
echo "appending the summary.txt with no of lines in each file... "
for i in {1..10}
 do
  echo "no of lines in file$i.txt is $(wc -l  file$i.txt)" >> /home/xpmini02/ProjectData/Report/summary.txt
 done
# we create a log.txt file to store the logs
echo "creating the log.txt in logs dorectory.."
if [ -e log.txt ]; then
  touch log.txt
fi

echo "you run the script on $(date)" >> /home/xpmini02/ProjectData/Logs/log.txt

cat /home/xpmini02/ProjectData/Logs/log.txt



