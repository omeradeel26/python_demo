#!/bin/bash

# Directory to change into (current directory + /modules)
target_dir="$1"

# move config file to parent file
mv "$target_dir/testing_report/.coveragerc" "$target_dir"

# remove pre-existing results
rm -r "$target_dir/testing_report" 

# Change into the target directory
cd "$target_dir" || exit

coverage run -m pytest
echo ""

#execute reports
coverage report
echo ""
coverage html

exit_code=$?

#remove all extra files
file_ending=".pytest_cache"
find "$target_dir" -type f -name "*$file_ending" -exec rm -f {} +

dir_name="__pycache__"
find "$target_dir" -type d -name "$dir_name" -exec rm -rf {} +

if [ -d "$target_dir/.pytest_cache" ]; then 
  rm -r "$target_dir/.pytest_cache"
fi

#move the report files into the testing_report
mkdir "$target_dir/testing_report"
mv "$target_dir/.coverage" "$target_dir/testing_report"
mv "$target_dir/htmlcov" "$target_dir/testing_report"
mv "$target_dir/.coveragerc" "$target_dir/testing_report"

exit $exit_code