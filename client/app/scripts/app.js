'use strict';

/**
 * @ngdoc overview
 * @name costSplitterApiApp
 * @description
 * # costSplitterApiApp
 *
 * Main module of the application.
 */
var app = angular.module('costSplitterApiApp', [
    'ngAnimate',
    'ngCookies',
    'ngResource',
    'ngRoute',
    'ngSanitize',
    'ngTouch'
]);

app.config(function ($routeProvider) {
  $routeProvider
    .when('/', {
      templateUrl: 'views/main.html',
      controller: 'MainCtrl'
    })
    .when('/about', {
      templateUrl: 'views/about.html',
      controller: 'AboutCtrl'
    })
    .when('/people', {
      templateUrl: 'views/people.html',
      controller: 'PeopleCtrl'
    })
    .otherwise({
      redirectTo: '/'
    });
});

app.factory('Person', ['$resource', function($resource) {
  return $resource('/api/v1/people/:id', null,
    { 'update': { method:'PUT' } }
  );
}]);
