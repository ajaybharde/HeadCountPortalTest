angular.module('app').controller('startCtrl', function ($scope, $rootScope, $http, $window, AppService, UserAdminService, HttpHelpers, Constants) {

    // ----- Declares ----- //
    $window.document.title = 'Home';
    $rootScope.busy = false;
    $scope.dto = {
        coloumnSearch: false,
        pageSize: 20,
        IsNoAccess: true
    };
    AppService.userDetails().then(function (data) {
        $scope.dto.UserDetails = data;
        if ($scope.dto.UserDetails.isSystemAdmin === true || $scope.dto.UserDetails.isAdmin === true || $scope.dto.UserDetails.isFacilitiesAdmin === true || $scope.dto.UserDetails.isSecurityTeam === true || $scope.dto.UserDetails.isReadOnlyUser === true) {
            $scope.dto.IsNoAccess = true;
        }
        else {
            $scope.dto.IsNoAccess = false;
        }
    });
    var role = 'SystemAdmin';
    UserAdminService.getAuthUsersByRole(role).then(function (response) {
        $scope.dto.AuthUsers = response.data;
        $rootScope.busy = false;
    });



});