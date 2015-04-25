'use strict';

angular.module('costSplitterApiApp')
  .controller('PeopleCtrl', ['$scope', 'Person', function ($scope, Person) {
    $scope.people = Person.query();

    // Get people
    var refreshPeople = function() {
      var currentTable = $scope.people;
      var newData = Person.query();

      angular.forEach(currentTable, function(item) {
        console.log(item);
      });
      // var person = new Person({name:'test person'});
      // $scope.people.push(person);
      // $scope.people = Person.query();
    };

    // Form data for creating a new person with ng-model
    $scope.personData = {};
    $scope.newPerson = function() {
      var person = new Person($scope.personData);
      person.$save({}, function() {
        refreshPeople();
      });
    };

    // Destroy person
    $scope.destroyPerson = function(person) {
      person.$delete({id:person.id}, function() {
        refreshPeople();
      });
    };

  }]);
