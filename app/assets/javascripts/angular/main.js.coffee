window.angular.module("RpForum", ["restangular", "ui.router"])
.config(["RestangularProvider", "$urlRouterProvider",
(RestangularProvider, $urlRouterProvider)->
    $urlRouterProvider.otherwise("/")

    RestangularProvider.setBaseUrl('/api/v1')
    RestangularProvider.setRequestSuffix('.json')

    RestangularProvider.addElementTransformer 'users', true, (user)->
        # signature is (name, operation, path, params, headers, elementToPost)
        user.addRestangularMethod('login', 'post', 'login')
        return user
])
