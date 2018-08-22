# Blockchain Backend (Ruby)
[![Build Status](https://travis-ci.com/archmagos/blockchain-backend-ruby.svg?branch=development)](https://travis-ci.com/archmagos/blockchain-backend-ruby) [![Maintainability](https://api.codeclimate.com/v1/badges/8fb0dd85e11fc6c6333c/maintainability)](https://codeclimate.com/github/archmagos/blockchain-backend-ruby/maintainability) [![Test Coverage](https://api.codeclimate.com/v1/badges/8fb0dd85e11fc6c6333c/test_coverage)](https://codeclimate.com/github/archmagos/blockchain-backend-ruby/test_coverage)
A blockchain-based ticketing app that allows users to purchase concert tickets and stores the validated transactions on a blockchain network. Created as part of our final project for the Makers Academy bootcamp during August 2018.
This repository represents the back-end 'blockchain' element to our project, while the Javascript/React front-end repository [can be found here](https://github.com/jeff1108/blockchain-ticketing-app). Our initial MVP is to set up a 'dummy' blockchain that mimics the way this technology processes and validates transactions. These transactions will then be sent to our 'chain', a basic Postgres database.
Once our MVP has been met, we hope to remove the Ruby back-end and replace it with a decentralised system built on the Ethereum network.

You can [read our full project log here](https://hackmd.io/FugFiGBnQ0ivaJpLaANYhQ).

## How to use
Our Ruby back-end server has no user interface, although it needs to be run in conjunction with the web front-end.
Please download or clone our repository, and navigate to the root directory. The following commands will install project dependencies and host our back-end on http://localhost:9292
```
> bundle install
> rackup
```

### Initial MVP
* Project setup ( Trello, Github, Travis CI, Heroku, Simplecov, Linter)
* A simple app that allows a user to see available concert tickets and make a purchase.
* A 'dummy' blockchain built on Ruby that sends ticket transactions to a Postgres database.

### First Sprint (21-22 August)
```
As a frequent concert goer,
So that I can see what concerts are available,
I want to see a list of available concerts
```
```
As a fan of Spice Girls,
So that I can see them live at a concert,
I want to make a purchase of a ticket
```
```
As a ticket purchaser,
So that I can get into the concert,
I want a confirmation with my ticket number
```

## Technologies used
| Stack    | Technologies Used | Test Suites |
| -------- | ----------------- | ----------- |
| BackEnd - Dummy blockchain   | Ruby, Sinatra     | Rspec       |
| BackEnd - Blockchain         | Ethereum, Solidity     | Truffle       |

## Learning Outcomes
To be completed at end of project

## Future/Further Improvements
To be completed at end of project

## Authors/Credits
* [Ben Luke Smith-Gordon](https://github.com/Ben-893)
* [Daniel Lau](https://github.com/dct-lau17)
* [Fred H](https://github.com/archmagos)
* [Jeff Hung](https://github.com/jeff1108)
* [Nabil Far](https://github.com/bilfar)
