function AppViewModel() {
    var self = this;
    models = {
        Master: function (item) {
            item = item || {};
            this.pin = ko.observable(item.pin || '');
        }
    }
    saveprocess = function () {
        if (self.Master().pin() == '' || self.Master().pin() == undefined) {
            document.getElementById("errorpin").innerHTML = "**Please enter pin provided in your email";
        } else if (self.Master().pin().length!=6) {
            document.getElementById("errorpin").innerHTML = "**Please enter pin provided in your email";
        } else {
            document.getElementById("errorpin").innerHTML = "";
            $.ajax({
                type: "POST",
                url: "/Main/CheckPin",
                dataType: "json",
                data: { Pin: self.Master().pin() },
                success: function (result) {
                    var name = result.Name;
                    if (name == "1") {
                        window.location = "NewPassword.aspx";
                    } else if (name == "0") {
                        Swal.fire({
                            icon: 'error',
                            title: 'Oops...',
                            text: 'Invalid Pin',
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