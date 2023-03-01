function AppViewModel() {
    var self = this;
    models = {
        Master: function (item) {
            item = item || {};
            this.smallplastic = ko.observable(item.smallplastic || '');
            this.bigplastic = ko.observable(item.bigplastic || '');
            this.dustbin = ko.observable(item.dustbin || '');
            this.sack = ko.observable(item.sack || '');
        }
    }
    saveprocess = function () {
        if ((self.Master().smallplastic() == '' || self.Master().smallplastic() == undefined) && (self.Master().bigplastic() == '' || self.Master().bigplastic() == undefined) && (self.Master().dustbin() == '' || self.Master().dustbin() == undefined) && (self.Master().sack() == '' || self.Master().sack() == undefined)) {
            const Toast = Swal.mixin({
                toast: true,
                position: 'top-end',
                showConfirmButton: false,
                timer: 5000,
                timerProgressBar: true,
                didOpen: (toast) => {
                    toast.addEventListener('mouseenter', Swal.stopTimer)
                    toast.addEventListener('mouseleave', Swal.resumeTimer)
                }
            })

            Toast.fire({
                icon: 'error',
                title: 'All fields cannot be empty'
            })
        } else if (self.Master().smallplastic() < 0 || self.Master().bigplastic() < 0 || self.Master().dustbin() < 0 || self.Master().sack()< 0) {
            const Toast = Swal.mixin({
                toast: true,
                position: 'top-end',
                showConfirmButton: false,
                timer: 5000,
                timerProgressBar: true,
                didOpen: (toast) => {
                    toast.addEventListener('mouseenter', Swal.stopTimer)
                    toast.addEventListener('mouseleave', Swal.resumeTimer)
                }
            })

            Toast.fire({
                icon: 'error',
                title: 'Fields cannot be negative'
            })
        } else {
            $.ajax({
                type: "POST",
                url: "/Main/InsertWasteData",
                dataType: "json",
                data: { SP: self.Master().smallplastic(), BP: self.Master().bigplastic(), DB: self.Master().dustbin(), sack: self.Master().sack() },
                success: function (result) {
                    var name = result.Name;
                    if (name == "Updated") {
                        
                        const Toast2 = Swal.mixin({
                            toast: true,
                            position: 'top-end',
                            showConfirmButton: false,
                            timer: 5000,
                            timerProgressBar: true,
                            didOpen: (toast) => {
                                toast.addEventListener('mouseenter', Swal.stopTimer)
                                toast.addEventListener('mouseleave', Swal.resumeTimer)
                            }
                        })

                        Toast2.fire({
                            icon: 'success',
                            title: 'Updated Successfully'
                        })
                        setTimeout(() => { window.location = "HomePage.aspx"; }, 5000);
                    }else if(name == "spam"){
                        const Toast3 = Swal.mixin({
                            toast: true,
                            position: 'top-end',
                            showConfirmButton: false,
                            timer: 8000,
                            timerProgressBar: true,
                            didOpen: (toast) => {
                                toast.addEventListener('mouseenter', Swal.stopTimer)
                                toast.addEventListener('mouseleave', Swal.resumeTimer)
                            }
                        })
                        Toast3.fire({
                            icon: 'error',
                            title: 'Spam data recorded, Please enter valid data only'
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