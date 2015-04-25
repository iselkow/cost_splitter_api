'use strict';

angular.module('costSplitterApiApp')
  .controller('PeopleCtrl', ['$scope', 'Person', function ($scope, Person) {
    $scope.people = Person.query();
  }]);
