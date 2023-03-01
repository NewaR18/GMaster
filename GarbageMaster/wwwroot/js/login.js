function AppViewModel() {
    var self = this;
    models = {
        Master: function (item) {
            item = item || {};
            this.uname = ko.observable(item.uname || '');
            this.password = ko.observable(item.password || '');
        }
    }
    saveprocess = function () {
        if (self.Master().uname() == '' || self.Master().uname() == undefined) {
            document.getElementById("errorusername").innerHTML = "**Please enter your Username";
        } else if (self.Master().password() == '' || self.Master().password() == undefined) {
            document.getElementById("errorusername").innerHTML = "";
            document.getElementById("errorpassword").innerHTML = "**Please enter your Password";
        } else {
            document.getElementById("errorusername").innerHTML = "";
            document.getElementById("errorpassword").innerHTML = "";
            $.ajax({
                type: "POST",
                url: "/Main/CheckLogin",
                dataType: "json",
                data: { uname: self.Master().uname(), password: self.Master().password() },
                success: function (result) {
                    var name = result.Name;
                    if (name == "ValidUser") {
                        window.location = "HomePage.aspx";
                        self.Master().uname("");
                        self.Master().password("");
                    } else if (name == "UsernameNotFound") {
                        Swal.fire({
                            icon: 'error',
                            title: 'Oops...',
                            text: 'Username not found',
                        })
                    } else if (name == "PasswordIncorrect") {
                        document.getElementById("errorpassword").innerHTML = "Incorrect Password, Please try again";
                    }
                    console.log(result);
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