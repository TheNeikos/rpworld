angular.module("RpForum").config(["$stateProvider",
($stateProvider)->
    $stateProvider.state("users", {
        url: "/users"
        templateUrl: "/assets/users/index.html"
        resolve: {
            users: ["User",(User)->
                User.getList()
            ]
        }
        controller: ["$scope", "users", ($scope, users)->
            $scope.users = users
        ]
    }).state("users.show", {
        url: "/:id"
        templateUrl: "/assets/users/show.html"
        resolve: {
            user: ["User", "$stateParams", (User, $stateParams)->
                User.one($stateParams.id)
            ]
        }
    })
])
