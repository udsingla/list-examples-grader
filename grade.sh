CPATH='.:lib/hamcrest-core-1.3.jar:lib/junit-4.13.2.jar'

rm -rf student-submission
rm -rf grading-area

mkdir grading-area

git clone $1 student-submission
echo 'Finished cloning'


# Draw a picture/take notes on the directory structure that's set up after
# getting to this point

# Then, add here code to compile and run, and do any post-processing of the
# tests
contains = `false`
for file in `find student-submission`
do
  if [[ -f $file ]] && [[ $file == ListExamples.java ]]
  then
    contains = true
  fi
done

if [[$contains == true]]
then
  cp ListExamples.java grading-area/
else
  echo "File not found."
  System.exit(1)
fi