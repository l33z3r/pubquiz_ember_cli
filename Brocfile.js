/* global require, module */

var EmberApp = require('ember-cli/lib/broccoli/ember-app');

var app = new EmberApp();

// Use `app.import` to add additional libraries to the generated
// output files.
//
// If you need to use different assets in different
// environments, specify an object as the first parameter. That
// object's keys should be the environment name and the values
// should be the asset to use in that environment.
//
// If the library that you are including contains AMD or ES6
// modules that you would like to import into your application
// please specify an object with the list of modules as keys
// along with the exports of each module as its value.
app.import('vendor/bootstrap/dist/css/bootstrap.css');

//local storage adapter for ember data
app.import("bower_components/ember-localstorage-adapter/localstorage_adapter.js");

//mock ajax
app.import( 'bower_components/jquery-mockjax/jquery.mockjax.js' );

//ember-pusher
app.import('vendor/pusher/dist/pusher.js');
app.import( 'bower_components/ember-pusher/ember-pusher.js' );

module.exports = app.toTree();
