﻿app.controller('userManagementController', ['$scope', '$rootScope', '$http', '$compile', '$timeout', '$q', '$sce', function ($scope, $rootScope, $http, $compile, $timeout, $q, $sce) {
    $scope.data = {
        UserTypes: { Admin: 1, GeneralAgent: 2, Agent: 3, Member: 4 },
        //RebateTypes: [{ ID: 1, Name: 'A' }, { ID: 2, Name: 'B' }, { ID: 3, Name: 'C' }],
        LoginUserId: null,
        IsAdmin: false,
        ParentUsers: []
    };

    $scope.init = function (userType, userId, loginUserId, isAdmin) {
        loginUserId = parseInt(loginUserId, 10);
        $scope.data.LoginUserId = loginUserId;
        $scope.data.IsAdmin = isAdmin.toLowerCase() == 'true' ? true : false;
        $scope.user.init(userType, userId);
        $scope.webApi.getParentUsers(userType, loginUserId);
    };

    $scope.user = {
        UserType: null,
        UserId: null,
        IsEdit: false,
        CurrentUser: { DefaultRebateType: '1', IsLocked: 'false' },
        RechargeAmount: null,
        init: function (userType, userId) {
            $scope.user.UserType = parseInt(userType, 10);
            $scope.user.UserId = userId != null ? parseInt(userId, 10) : 0;
            if ($scope.user.UserId > 0) {
                $scope.user.getCurrentUser($scope.user.UserId);
            }
        },
        getCurrentUser: function (userId) {
            $http.post('/User/GetUser/' + userId, {}).then(function (res) {
                console.log(res);
                if (res.data.Success) {
                    $scope.user.CurrentUser = angular.merge($scope.user.CurrentUser, res.data.Data);
                    $scope.user.CurrentUser.IsLocked = $scope.user.CurrentUser.IsLocked ? 'true' : 'false';
                    $scope.user.CurrentUser.DefaultRebateType = $scope.user.CurrentUser.DefaultRebateType.toString();
                    $scope.user.CurrentUser.Password = '';

                    console.log($scope.user.CurrentUser);
                } else {
                    alert(res.data.Message)
                }
            });
        },
        save: function () {
            var pwd = $scope.user.CurrentUser.Password;
            if (pwd != null && pwd.length > 0) {
                var regex = new RegExp('(?=.*[0-9])(?=.*[a-zA-Z]).{6,20}');
                if (!regex.test(pwd)) {
                    alert('密码过于简单, 请输入至少6位的数字与字母组合密码')
                    return;
                }
            }
            var data = {
                type: $scope.user.UserType,
                user: $scope.user.CurrentUser,
                rebateType: $scope.user.CurrentUser.DefaultRebateType,
                rechargeAmount: $scope.user.RechargeAmount
            };
            $http.post('/User/SaveUser', data).then(function (res) {
                console.log(res);
                if (res.data.Success) {
                    $scope.user.DataBak = angular.copy($scope.user.Data);

                    if (!isNaN($scope.user.RechargeAmount) && $scope.user.RechargeAmount > 0) {
                        if ($scope.user.CurrentUser.UserExtension == null) {
                            $scope.user.CurrentUser.UserExtension = { Amount: 0 };
                        }
                        $scope.user.CurrentUser.UserExtension.Amount = parseFloat($scope.user.CurrentUser.UserExtension.Amount, 10) + parseFloat($scope.user.RechargeAmount, 10);
                    }

                    //更新登录用户余额
                    $('#balance').val(res.data.Data);

                    alert('操作成功!');

                    $scope.user.gotoList();
                } else {
                    alert(res.data.Message);
                }
            });
        },
        gotoList: function () {
            var url = '';

            switch ($scope.user.UserType) {
                case $scope.data.UserTypes.GeneralAgent: url = '/user/GeneralAgent'; break;
                case $scope.data.UserTypes.Agent: url = '/user/Agent'; break;
                case $scope.data.UserTypes.Member: url = '/user/Member'; break;
            }

            location.href = url;
        },
        revert: function () {
            $scope.user.Data = angular.copy($scope.user.DataBak);
        },
    };

    $scope.webApi = {
        getParentUsers: function (userType, loginUserId) {
            // 添加代理/会员时取父亲节点
            if (userType == $scope.data.UserTypes.Agent || userType == $scope.data.UserTypes.Member) {
                $http.post('/api/User/GetParentUsers/' + userType, {}).then(function (res) {
                    console.log(res);
                    if (res.data.Success) {
                        $scope.data.ParentUsers = res.data.Data;
                        if ($scope.user.CurrentUser.ParentUserId == null && $scope.data.ParentUsers.length > 0) {
                            if ($scope.data.IsAdmin) {
                                $scope.user.CurrentUser.ParentUserId = $scope.data.ParentUsers[0].UserId;
                            } else {
                                $scope.user.CurrentUser.ParentUserId = loginUserId;
                            }
                        }
                    }
                });
            } else {
                if ($scope.user.UserType == $scope.data.UserTypes.GeneralAgent) {
                    // 添加总代理, 登录人是admin
                    $scope.user.CurrentUser.ParentUserId = loginUserId;
                    $scope.data.ParentUsers = [{ UserId: loginUserId, UserName: 'Admin' }];
                }
            }
        },
    };
}]);