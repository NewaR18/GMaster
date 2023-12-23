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
            var sp1 = self.Master().smallplastic() == '' ? 0 : self.Master().smallplastic();
            var bp1 = self.Master().bigplastic() == '' ? 0 : self.Master().bigplastic();
            var db1 = self.Master().dustbin() == '' ? 0 : self.Master().dustbin();
            var sk1 = self.Master().sack() == '' ? 0 : self.Master().sack();
            console.log(sp1);
            console.log(bp1);
            console.log(db1);
            console.log(sk1);
            $.ajax({
                
                type: "POST",
                url: "/Main/InsertWasteData",
                dataType: "json",
                data: { SP: sp1, BP: bp1, DB: db1, sack: sk1 },
                success: function (result) {
                    var name = result.Name;
                    if (name == "Updated") {
                        Swal.fire({
                            title: 'Waste Calculations',
                            html:'Your data is stored as a total weight in database with following calculations: <br/>'+
                                'Small Bag: <b>' + sp1 + ' * '+ ' 1 '+' = '+sp1*1+'</b> (in Plastics)<br/>' +
                                'Big Bag: <b>' + bp1 + ' * ' + ' 4 ' + ' = ' + bp1 * 4 + '</b> (in Plastics)<br/>' +
                                'Dustbin: <b>' + db1 + ' * ' + ' 6 ' + ' = ' + db1 * 6 + '</b> (in Plastics)<br/>' +
                                'Sackbag: <b>' + sk1 + ' * ' + ' 12 ' + ' = ' + sk1 * 12 + '</b> (in Plastics)<br/><br/>' +
                                '<p style="font-size:25px;"><b>Total Weight: ' + (sp1 * 1 + bp1 * 4 + db1 * 6 + sk1 * 12) + ' (in Plastics)</b><p>',
                            allowOutsideClick: false,
                            showClass: {
                                popup: 'animate__animated animate__fadeInDown'
                            },
                            hideClass: {
                                popup: 'animate__animated animate__fadeOutUp'
                            },
                            icon: 'info',
                            confirmButtonColor: '#04736a',
                            confirmButtonText:'<i class="fa fa-thumbs-up"></i> Great!',
                            }).then((result) => {
                            if (result.isConfirmed) {
                                window.location = "TableDisplay.aspx";
                            }
                            })
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