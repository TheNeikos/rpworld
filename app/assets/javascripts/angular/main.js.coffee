window.angular.module("RpForum", ["restangular", "ui.router"])
.config(["RestangularProvider", "$urlRouterProvider", "$locationProvider"
(RestangularProvider, $urlRouterProvider, $locationProvider)->

    $locationProvider.html5Mode(true)

    $urlRouterProvider.otherwise("/")

    RestangularProvider.setBaseUrl('/api')
    RestangularProvider.setRequestSuffix('.json')

    RestangularProvider.addElementTransformer 'users', true, (user)->
        # signature is (name, operation, path, params, headers, elementToPost)
        user.addRestangularMethod('login', 'post', 'login')
        return user



]).run(["$rootScope", ($rootScope)->
    $rootScope.$on('$stateChangeStart',(event, toState, toParams, fromState, fromParams)->
      console.log('$stateChangeStart to '+toState.to+'- fired when the transition begins. toState,toParams : \n',
      toState, toParams)
    )
    $rootScope.$on('$stateChangeError',(event, toState, toParams, fromState, fromParams)->
      console.log('$stateChangeError - fired when an error occurs during transition.')
      console.log(arguments)
    )
    $rootScope.$on('$stateChangeSuccess',(event, toState, toParams, fromState, fromParams)->
      console.log('$stateChangeSuccess to '+toState.name+'- fired once the state transition is complete.')
    )
    $rootScope.$on('$viewContentLoaded',(event)->
      console.log('$viewContentLoaded - fired after dom rendered',event)
    )
    $rootScope.$on('$stateNotFound',(event, unfoundState, fromState, fromParams)->
      console.log('$stateNotFound '+unfoundState.to+'  - fired when a state cannot be found by its name.')
      console.log(unfoundState, fromState, fromParams)
    )
])
