# ftrio

Ftrio is tool for managing software development process. It has usefull rake tasks that manages git branches and heroku apps. 

## Philosophy

### feature-branch

feature-branch is the specific branch that holds all the commits related to that feature.

### compiled-feature-branch

compiled-feature-branch is the copy of feature-branch. But it also holds necesassy precompiled assets.

### feature-app

feature-app is a heroku app which holds compiled-feature-branch.

## Installation

Just add ``` gem 'ftrio' ``` to your GemFile

## Usage

### ftrio:create[feature]

+ Creates feature-branch
+ Creates compiles-feature-branch for that feature
+ Compiles assets in compiled-feature-branch
+ Commits compiled assets in compiled-feature-branch
+ Creates feature-app just for that feature at heroku
+ Pushes compiled-feature-branch into feature-app

### ftrio:push

+ Compiles feature-branch into compiled-feature-branch
+ Pushes compiled-feature-branct to feature-app

### ftrio:destroy

+ Destroyes feature-branch
+ Destroyes compiles-feature-branch
+ Destroyes feature-app
