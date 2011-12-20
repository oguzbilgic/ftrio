# ftrio

Ftrio is tool for managing software development process. It has usefull rake tasks that manages git branches and heroku apps. 

## Philosophy

Ftrio has unique Philosophy for managing software development process using heroku and git. 

### feature-branch

feature-branch is the specific branch that holds all the commits related to that feature.

### feature-app

feature-app is a heroku app which holds feature-branch.

## Installation

Just add ``` gem 'ftrio' ``` to your GemFile

## Usage

### ftrio:create[feature]

+ Creates feature-branch
+ Creates feature-app just for that feature at heroku
+ Pushes feature-branch into feature-app

### ftrio:push

+ Pushes feature-branch to feature-app

### ftrio:destroy

+ Destroyes feature-branch
+ Destroyes feature-app
