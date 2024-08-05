# Project Overview

This project was developed as part of an interview process at Sonata. The purpose of this project is to showcase the ability to use different Ruby constructs such as lambdas, blocks, and Procs. Additionally, tests were added to demonstrate the ability to write and execute RSpec tests.
- Feel free to review the repo, a development branch was set and then merged as to showcase that gitflow was followed to work on this project.


## Files

- `get_min_weather_spread.rb`: This script processes the `w_data.dat` file to find the team with the smallest goal difference. It uses a lambda to read each line of the .dat file.
- `get_min_max_goals.rb`: This script processes the `soccer.dat` file to find the team with the smallest goal difference. It uses a block and a Proc to process each line of the file.
- `spec/file_permissions_spec.rb`: This RSpec test checks if the files in the `data` directory can be read and have the appropriate read permissions.
- `spec/get_min_weather_spread_spec.rb`: This test checks that error messages are handled correctly and that the script runs and ends gracefully. Mocks test that we are sending the correct file and receiving the expected output or the appropiate error.
- `spec/get_min_max_goals_spec.rb`: This test checks that error messages are handled correctly and that the script runs and ends gracefully.Mocks test that we are sending the correct file and receiving the expected output or the appropiate error.


## Execution Instructions

### Prerequisites

- Ruby installed on your system.
- RSpec gem installed (`gem install rspec`).

### Running the Scripts

#### macOS and Linux

1. **Navigate to the project directory:**

   ```sh
   cd /path/to/project
   ./get_min_max_goals.rb <path_to_file>
   ./get_min_weather_spread.rb <path_to_file>
   both .dat file can be found in the /dat directory as w_data.dat and soccer.dat
   e.g.
   ./get_min_max_goals.rb data/soccer.dat
   ```
