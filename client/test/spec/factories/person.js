'use strict';

describe('Person', function() {
  var mockPersonResource, $httpBackend;

  beforeEach(angular.mock.module('costSplitterApiApp'));

  beforeEach(function() {
    angular.mock.inject(function ($injector) {
      $httpBackend = $injector.get('$httpBackend');
      mockPersonResource = $injector.get('Person');
    });
  });

  describe('query', function() {
    it('returns all people', function() {
      var isaac = {'id':1,'name':'Isaac','paid':false};

      $httpBackend.expectGET('/api/v1/people')
        .respond([isaac, {'id':2,'name':'Ben','paid':true}]);

      var result = mockPersonResource.query();

      $httpBackend.flush();

      expect(result.length).toEqual(2);
      expect(angular.equals(result[0], isaac)).toBe(true);
    });
  });
});
