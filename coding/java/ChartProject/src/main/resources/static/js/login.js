var main = {
    init : function (){
        var _this = this;
        $('#btn-login').on('click', function (){
            _this.login();
        });
    },
    login : function () {
        var data = {
            userNo: $('#id').val(),
            userPw: $('#password').val()
        };

        $.ajax({
            type: 'POST',
            url: '/user/getLoginInfo',
            dataType: 'json',
            contentType: 'application/json; charset=utf-8',
            data: JSON.stringify(data)
        }).done(function (data) {
            alert('로그인 성공!');
            window.location.href = '/user/login';
        }).fail(function (error, textStatus) {
            if (error.status = 200){
                alert('아이디 혹은 비밀번호가 일치하지 않습니다.');
            } else {
                alert(JSON.stringify(error));
            }
        });
    }
};

main.init();