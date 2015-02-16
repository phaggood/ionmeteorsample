    angular.module('socially',['angular-meteor','ui.router','ionic','angularUtils.directives.dirPagination']);

    function onReady() {
        angular.bootstrap(document, ['socially']);
    }

    if (Meteor.isCordova) {
        angular.element(document).on("deviceready", onReady);
    }
    else {
        angular.element(document).ready(onReady);
    }