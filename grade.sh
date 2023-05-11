CPATH='.:lib/hamcrest-core-1.3.jar:lib/junit-4.13.2.jar'

set -e
rm -rf student-submission
rm -rf grading-area

mkdir grading-area

git clone $1 student-submission
echo 'Finished cloning'


# Draw a picture/take notes on the directory structure that's set up after
# getting to this point

# Then, add here code to compile and run, and do any post-processing of the
# tests
contains= $false
for file in `find student-submission`
do
  if [[ -f $file ]] && [[ $file == ListExamples.java ]]
  then
    $contains= $true
  fi
done

if [[ $contains == $true ]]
then
  cp student-submission/ListExamples.java grading-area/
else
  echo "File not found."
  exit 1
fi

cp TestListExamples.java grading-area/

set +e
javac grading-area/ListExamples.java 2> grading-area/errors.txt
if [[ $? -ne 0 ]]
then
  echo compilation error
  exit 2
fi

set -e
echo hello