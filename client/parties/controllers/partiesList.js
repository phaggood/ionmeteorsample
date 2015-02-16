angular.module("socially").controller("PartiesListCtrl", ['$state','$scope', '$meteorCollection',
    '$meteorSubscribe',
    function($state,$scope, $meteorCollection,$meteorSubscribe){
        $scope.page = 1;
        $scope.perPage = 3;
        $scope.sort = { name: 1 };

        $scope.pageChanged = function(newPage) {
            $scope.page = newPage;
        };

        $scope.parties = $meteorCollection(function() {
            return Parties.find({}, {
                sort : $scope.sort
            });
        });

        $meteorSubscribe.subscribe('parties', {
            limit: parseInt($scope.perPage),
            skip: parseInt(($scope.page - 1) * $scope.perPage),
            sort: $scope.sort
        }).then(function(){
            $scope.partiesCount = $meteorCollection(Counts)[0];
        });

        $scope.remove = function(party){
            $scope.parties.remove(party);
        };
        $scope.removeAll = function(){
            $scope.parties.remove();
        };
    }]);