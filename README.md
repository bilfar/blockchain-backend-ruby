# Blockchain Backend (Ruby)
Travis badge / Code Coverage / Code Quality badges here
A blockchain-based ticketing app that allows users to purchase concert tickets and stores the validated transactions on a blockchain network. Created as part of our final project for the Makers Academy bootcamp during August 2018.
This repository represents the back-end 'blockchain' element to our project, while the Javascript/React front-end repository [can be found here](). Our initial MVP is to set up a 'dummy' blockchain that mimics the way this technology processes and validates transactions. These transactions will then be sent to our 'chain', a basic Postgres database.
Once our MVP has been met, we hope to remove the Ruby back-end and replace it with a decentralised system built on the Ethereum network.

You can [read our full project log here]().

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
Learning Objectives

## Future/Further Improvements
What I would do next

## Authors/Credits
* [Ben Luke Smith-Gordon](https://github.com/Ben-893)
* [Daniel Lau](https://github.com/dct-lau17)
* [Fred H](https://github.com/archmagos)
* [Jeff Hung](https://github.com/jeff1108)
* [Nabil Far](https://github.com/bilfar)
