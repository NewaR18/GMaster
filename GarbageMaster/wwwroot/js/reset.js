function AppViewModel() {
    var self = this;
    models = {
        Master: function (item) {
            item = item || {};
            this.email = ko.observable(item.email || '');
        }
    }
    saveprocess = function () {
        if (self.Master().email() == '' || self.Master().email() == undefined) {
            document.getElementById("erroremail").innerHTML = "**Please enter your Email Address";
        }  else {
            document.getElementById("erroremail").innerHTML = "";
            $.ajax({
                type: "POST",
                url: "/Main/CheckEmail",
                dataType: "json",
                data: { email: self.Master().email() },
                success: function (result) {
                    var name = result.Name;
                    if (name == "Exists") {
                        console.log(result);
                        $.ajax({
                            type: "POST",
                            url: "/Main/SendEmail",
                            dataType: "json",
                            data: { email: self.Master().email() },
                            success: function (result) {
                                var myvalue = result.Name;
                                if (myvalue == "sent") {
                                    window.location = "pinenter.aspx";
                                }
                            },
                            error: function (req, status, error) {
                                console.log(status);
                            }
                        });
                    } else if (name == "None") {
                        Swal.fire({
                            icon: 'error',
                            title: 'Oops...',
                            text: 'Email not found',
                        })
                    }
                    
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