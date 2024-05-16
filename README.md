# Code Coverage and Testing in Python - Demo

## Overview
Demo to present code coverage and testing in Python. The following demo uses the pytest and coverage.py dependencies. Read the extra documetation linked to understand pros and cons of this and other similair dependencies.

## Installation

1. Download and open Git repository on machine.
2. Install Python if required.
3. Run the following command to install the project dependencies.

    ```bash
    pip install -r requirements.txt
    ```

## Usage

To add a test case to the existing module, create a new function within the `\tests\test_lambda_module.py` file. This file contains dummy testing functions which uses basic string comparisons to explemplify code coverage/testing. After creating the function, use the `assert` keyword to return a boolean value of the result of the test. The following examples show how to create and test code in your codebase as well as integrating code coverage.

### Example 1: Function Creation
```python
def get_from_database():
    """Dummy function to get data from a database."""
    print("Getting data from the database")
    return "Dummy data"  # Dummy return value
```

### Example 2: Function Testing

```python
import pytest

from lambda_module import get_from_database

def test_get_from_database():
    """Test get_from_database function."""
    assert get_from_database() == "Dummy data"
```

### Example 3: Implementing Code Coverage in Program
The code coverage report automatically checks for executed lines and compares it with pytest to see which functions have been tested. To remove blocks or lines of code from testing, include the following comment in your code:
```python
#pragma: no cover
```

### Example
```python
if __name__ == "__main__": #pragma: no cover
    main()
```
This removes the entire 'if block' from your code coverage report.

## Pipeline Shell Script

To perform the tests and obtain coverage results in a directory, run `cd pipeline` and run  `bash coverage.sh path/to/directory` to obtain the coverage results. To view these results, open the `testing_report` directory located within the executed directory. Refer to the `coverage.py` docs to correctly configure the code coverage report in the `.coveragerc` file ie. branching coverage, coverage failure benchmark etc. To integrate this into a CI/CD pipeline, note that the shell script returns an exit code of 2 if it fails or 0 otherwise.


## Testing

### Running Tests
To execute tests in the project, run the following command. This searches the directory for all pytest unit-tests and executes them. The results of the tests are outputed to the terminal.

```bash
pytest
```

### Viewing Coverage Report
To view code coverage, run the following command. The first command outputs the results in the terminal. To get a detailed analysis, run the next command which outputs the results as an interactive report-based webpage. 
```bash
coverage run -m pytest
coverage html
```

Open the generated HTML coverage report manually in the file manually located at `.\htmlcov\index.html`.

## Extra Documentation 

[Coverage.py Docs](https://coverage.readthedocs.io/en/7.5.1/)  
[Pytest Docs](https://docs.pytest.org/en/7.1.x/contents.html)  
[Code Coverage + Testing Dependencies Overview](https://docs.google.com/document/d/1VvctFc_qnSyz3E4yprpXRA6hC4Dh-2wHqlDM5bQc9u4/edit?usp=sharing)