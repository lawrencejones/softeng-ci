angular.module('softeng', [])

.controller('SentimentController', function($scope, $http, $log) {
  $scope.input = { content: '' };
  $scope.checkSentiment = function(content) {
    $http({
      method: 'POST',
      url: '/sentiment',
      data: {content: content},
    })
      .then(function(response) {
        $scope.score = response.data.score;
      });
  };
});
