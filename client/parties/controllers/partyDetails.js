angular.module("socially").controller("PartyDetailsCtrl", ['$state','$scope', '$stateParams', '$meteorObject','$meteorCollection',
    function($state,$scope, $stateParams, $meteorObject,$meteorCollection){

        $scope.party = $meteorObject(Parties, $stateParams.partyId).subscribe('parties');
        $scope.users = $meteorCollection(Meteor.users, false).subscribe('users');

        $scope.save = function() {
            $scope.party.save().then(function(numberOfDocs){
                console.log('save success doc affected ', numberOfDocs);
            }, function(error){
                console.log('save error', error);
            });
            $state.go('parties');
        };

        $scope.cancel = function() {
            $state.go('parties');
        };

        $scope.reset = function() {
            $scope.party.reset();
            $state.go('parties');
        };

    }]);
