angular.module("RpForum").service("User", ["Restangular", (Restangular)->
    return Restangular.service("user")
])
