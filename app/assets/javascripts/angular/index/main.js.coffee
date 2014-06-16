angular.module("RpForum").config(["$stateProvider",
($stateProvider)->
    $stateProvider.state("index", {
        url: "/"
        templateUrl: "assets/index/index.html"
    })
])
