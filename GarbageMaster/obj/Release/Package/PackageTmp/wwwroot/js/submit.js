function AppViewModel() {
    var self = this;
    models = {
        Master: function (item) {
            item = item || {};
            this.name = ko.observable(item.name || '');
            this.email = ko.observable(item.email || '');
            this.subject = ko.observable(item.subject || '');
            this.message = ko.observable(item.message || '');
            this.res = ko.observable(item.res || '');
            this.res2 = ko.observable(item.res2 || '');
        }
    }
    savethis = function () {
        $.ajax({
            type: "POST",
            url: "/Main/PostName",
            dataType: "json",
            data: { name: self.Master().name(), email: self.Master().email(), subject: self.Master().subject(), message: self.Master().message() },
            success: function (result) {
                var name = result.Name;
                if (name == "Submitted") {
                    Swal.fire({
                        title: 'Great!',
                        text: 'Your Review has been submitted, Our Team will get back to you with in a week',
                        icon: 'success',
                        confirmButtonColor: '#04736a',
                        confirmButtonText: 'Okay'
                    })
                } else {
                    Swal.fire({
                        title: 'Sorry!',
                        text: 'Your review could not be submitted, please fill all fields',
                        icon: 'error',
                        confirmButtonColor: '#ff5a5a',
                        confirmButtonText: 'Okay'
                    })
                }
                self.Master().name("");
                self.Master().email("");
                self.Master().subject("");
                self.Master().message("");
                console.log(result);
            },
            error: function (req, status, error) {
                console.log(status);
                console.log(req);
                console.log(error);
            }
        });
    }
    clearall = function () {
        self.Master().name("");
        self.Master().email("");
        self.Master().subject("");
        self.Master().message("");
        self.Master().res("");
        self.Master().res2("");
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
