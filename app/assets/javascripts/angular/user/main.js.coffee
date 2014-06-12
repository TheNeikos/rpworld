angular.module("RpForum").config(["$stateRouter",
($stateProvider)->
    $stateProvider.state("users", {
        url: "/users"
        templateUrl: "/assets/templates/users/index.html"
        resolve: {
            users: ["User",(User)->
                User.all()
            ]
        }
        controller: ["$scope", ($scope, users)->
            $scope.users = users
        ]
    })
])
