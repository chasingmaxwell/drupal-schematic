# Drupal Schematic

Drupal Schematic is a boilerplate for Drupal projects utilizing a build and
deploy workflow. It uses [drush make](http://drush.org/en/master/make/),
[features](https://www.drupal.org/project/features), and
[master](https://www.drupal.org/project/master) to create the "schematic"
for a Drupal site. The not-so-secret sauce that makes this project useful are
the `./build` and `./deploy` scripts it ships with. These scripts take the state
of your project and either build a Drupal site for local development or deploy
the site remotely.

__NOTE: Currently only deployment to Pantheon is supported.__ This was all I
needed when initially developing this project. If you need support for another
deployment method, let's chat!

## Dependencies

You need [drush](http://drush.org/en/master/install/) and a unix-like operating
system to use Drupal Schematic.

## Installation

1. You probably don't want the history of this repository in your project, so I
would recommend downloading it instead of cloning.

2. Once you have it downloaded, move it to whatever directory you'd like and run
`git init`.

3. Edit `sites/default/settings.php` as needed.

That's it! You're ready to start editing make files and adding your custom
modules and themes. See below for building the site for local development and
deploying.

## Usage

### Building

It's as simple as `./build <TARGET DIRECTORY>`. I recommend first running
`./build --help` to understand the available options and configuration.

The build script creates a complete Drupal site at the specified target
directory. After creating the site it runs a number of drush commands (like updb
and fra) to make sure the site is up-to-date.

### Deploying

Also pretty easy `./deploy <PANTHEON SITE ID>`. Again, you should run
`./deploy --help` to understand the available options and configuration.

The deployment script commits the result of a build to the repository associated
with your Pantheon site. It uses the same branch name as the one currently
checked out in your source repository. If your branch name is not
"master", the deploy script creates a new multidev environment on Pantheon with
the same name as your current branch. Then the deployment script runs a number
of drush commands (like updb and fra) to make sure the site is up-to-date.

## Configuration

There are a number of configuration variables you can take advantage of to save
you some time when running the build and deploy scripts. Take a look at
.buildconfig.default and .deployconfig.default to learn about them.

### Structure

- `sites/all/modules/custom` and `sites/all/themes/custom` contain your custom
  modules and themes.

- `settings.php` is what you would find in default.settings.php in a typical
  Drupal project with the addition of master module configuration at the bottom.
  You will need to edit this file to have a functional Drupal site.

- `common.make` is your main make file. It is included by `development.make` and
  `deployment.make` so it's used in both development and deployment builds.

- `deployment.make` is used in deployment builds and includes `common.make`.

- `development.make` is used in development builds and includes `common.make`.

### FAQs

1. How do I add a contrib module?

Add the module to your make file AND the master_modules array in settings.php.
Both of these steps are required to add and enable a new module.

2. How do I add a custom module?

Include your custom module in sites/all/modules/custom AND add the module
name to the master_modules array in settings.php.
