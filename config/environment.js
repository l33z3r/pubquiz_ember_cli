/* jshint node: true */

module.exports = function(environment) {
  var ENV = {
    environment: environment,
    baseURL: '/',
    locationType: 'hash',
    EmberENV: {
      FEATURES: {
        // Here you can enable experimental features on an ember canary build
        // e.g. 'with-controller': true
      }
    },

    APP: {
      // Here you can pass flags/options to your application instance
      // when it is created
    }
  };

  if (environment === 'development') {
    // ENV.APP.LOG_RESOLVER = true;
    ENV.APP.LOG_ACTIVE_GENERATION = true;
    // ENV.APP.LOG_TRANSITIONS = true;
    // ENV.APP.LOG_TRANSITIONS_INTERNAL = true;
    ENV.APP.LOG_VIEW_LOOKUPS = true;

    //proxy all xhr through ember cli
    ENV.RAILS_API_SERVER_URL = "";
  }

  if (environment === 'test') {
    ENV.RAILS_API_SERVER_URL = "http://192.168.1.15:3000"
  }

  if (environment === 'production') {
    //ENV.RAILS_API_SERVER_URL = "http://www.tablequiz.com"
    ENV.RAILS_API_SERVER_URL = "http://192.168.1.15:3000"
  }

  return ENV;
};
