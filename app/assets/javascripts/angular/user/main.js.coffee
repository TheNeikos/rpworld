angular.module("RpForum")
.config(["$stateProvider", ($stateProvider)->
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
    }).state("user", {
        url: "/user/:id"
        templateUrl: "/assets/users/show.html"
        resolve: {
            user: ["User", "$stateParams", (User, $stateParams)->
                User.one($stateParams.id).get()
            ]
        }
        controller: ["$scope", "user", ($scope, user)->
            $scope.user = user
        ]
    }).state("user_login", {
        url: "/login"
        templateUrl: "/assets/users/login.html"
        controller: ["$scope", "User", ($scope, User)->
            $scope.user = {}
            $scope.login = (user)->
                console.log user
                console.log User
        ]
    })
])
