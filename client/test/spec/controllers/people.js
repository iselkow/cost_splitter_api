'use strict';

describe('Controller: PeopleCtrl', function () {

  // load the controller's module
  beforeEach(module('costSplitterApiApp'));

  var PeopleCtrl, scope, Person;

  var isaac = {'id':1,'name':'Isaac','paid':false};
  var ben = {'id':2,'name':'Ben','paid':true};

  // Initialize the controller and a mock scope
  beforeEach(inject(function ($controller, $rootScope) {
    Person = {
      query: function() {}
    };

    spyOn(Person, 'query').and.returnValue([isaac, ben]);

    scope = $rootScope.$new();
    PeopleCtrl = $controller('PeopleCtrl', {
      $scope: scope,
      Person: Person
    });
  }));

  it('should attach returned people to the scope', function() {
    expect(scope.people.length).toBe(2);
    expect(angular.equals(isaac, scope.people[0])).toBe(true);
  });
});
