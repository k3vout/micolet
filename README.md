# MICOLET

Subscribe to Micolet newsletter.

![image](https://github.com/sevinchek/micolet/assets/39852288/a9529f49-615b-46dd-873f-2ceeaaac2e9a)

## Getting Started

### Requirements

Ruby 3.2.1

### Installation

1. Clone the repo

   ```sh
   git clone git@github.com:sevinchek/micolet.git
   ```

2. Install ruby gems dependencies

   ```sh
   bundle install
   ```

3. Install Javascript dependencies

   ```sh
   yarn install
   ```

4. Database creation

   ```
   rails db:prepare
   ```

5. .ENV file setup

   ```
   ABSTRACT_API_KEY = "ABC123"
   ```

6. Seed database

   ```
   rails db:seed
   ```

7. Run the web server

   ```sh
   bin/dev
   ```

8. Access to the website in a browser with the following link

   ```sh
   localhost:3000
   ```

### Test

1. For testing run:

   ```sh
   rspec
   ```
