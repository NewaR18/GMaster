function AppViewModel() {
    var self = this;
    models = {
        Master: function (item) {
            item = item || {};
            this.pw = ko.observable(item.pw || '');
            this.cpw = ko.observable(item.cpw || '');
        }
    }
    saveprocess = function () {
        if (self.Master().pw() == '' || self.Master().pw() == undefined) {
            document.getElementById("errorpw").innerHTML = "**Please enter your Password";
        } else if (self.Master().cpw() == '' || self.Master().cpw() == undefined) {
            document.getElementById("errorpw").innerHTML = "";
            document.getElementById("errorcpw").innerHTML = "**Please confirm your password";
        } else if (self.Master().pw().length < 8) {
            document.getElementById("errorcpw").innerHTML = "";
            document.getElementById("errorpw").innerHTML = "**Your password should be of at least 8 digits";
        } else if (self.Master().pw() != self.Master().cpw()) {
            document.getElementById("errorpw").innerHTML = "";
            document.getElementById("errorcpw").innerHTML = "**Your Password and Confirm Password is not matching";
        } else {
            document.getElementById("errorpw").innerHTML = "";
            document.getElementById("errorcpw").innerHTML = "";
            $.ajax({
                type: "POST",
                url: "/Main/ResetPassword",
                dataType: "json",
                data: { Password: self.Master().pw()},
                success: function (result) {
                    var name = result.Name;
                    if (name == "Updated") {
                        window.location = "Login.aspx";
                    } else if (name == "SessionExpired") {
                        Swal.fire({
                            icon: 'error',
                            title: 'Oops...',
                            text: 'Session is Expired',
                        })
                    }
                    console.log(name);

                },
                error: function (req, status, error) {
                    console.log(status);
                    console.log(req);
                    console.log(error);
                }
            });
        }
    }
    Init = function () {
        self.Master = ko.observable(new models.Master());
    }
    Init();
}
var obj;
$(document).ready(function () {
    obj = new AppViewModel();
    ko.applyBindings(obj);
});