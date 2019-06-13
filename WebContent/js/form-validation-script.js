var Script = function () {

    $.validator.setDefaults({
        submitHandler: function() { alert("submitted!"); }
    });

    $().ready(function() {
        // validate the comment form when it is submitted
        $("#feedback_form").validate();

        // validate signup form on keyup and submit
        $("#register_form").validate({
            rules: {
                username: {
                    required: true
                },
                password: {
                    required: true,
                    minlength: 6,
                    maxlength: 20
                },
                confirm_password: {
                    required: true,
                    minlength: 6,
                    maxlength: 20,
                    equalTo: "#password"
                },
                email: {
                    required: true,
                    email: true
                },
                agree:"required"
            },
            messages: {   
                username: {
                    required: "请输入用户名.",
                },
                password: {
                    required: "请输入密码.",
                    minlength: "请至少输入6个字符.",
                    maxlength: "请最多输入20个字符."
                },
                confirm_password: {
                    required: "请输入确认密码.",
                    minlength: "请至少输入6个字符.",
                    maxlength: "请最多输入20个字符.",
                    equalTo: "请重复输入密码以确认."
                },
                email: "请输入正确的邮箱地址.",
                agree: "请同意《使用协议》."
            }
        });

    });


}();