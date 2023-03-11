$(function () {
    $.ajax({
        type: "GET",
        url: "/Main/GetWards",
        dataType: "json",
        success: function (result) {
            console.log(result);
            var obj = {
                width: "100%",
                height: 662,
                resizable: false,
                editable:false,
                title: "This",
                showBottom: false,
                scrollModel: { autoFit: true },
                dataModel: { data: result }
            };
            obj.colModel = [
                { title: "Id", dataType: "string", align:"left", dataIndx: "ward", width: '4%', resizable: false },
                { title: "Name", dataType: "string", dataIndx: "name", width: '6%' },
                { title: "Ward", dataType: "string", dataIndx: "ward_no", width: '8%' },
                { title: "Email", dataType: "string", dataIndx: "email", width: '22%' },
                { title: "Phone", dataType: "string", dataIndx: "phone", width: '10%' },
                { title: "Location", dataType: "string", dataIndx: "location", width: '10%' },
                { title: "Population", dataType: "string", dataIndx: "population", width: '8%' },
                { title: "Chief", dataType: "string", dataIndx: "chief", width: '22%' },
                { title: "ChiefPhone", dataType: "string", dataIndx: "chiefphone", width: '9%' }
            ];
            obj.pageModel = { rPP: 32, type: "local" };
            $("#grid_json").pqGrid(obj);
        },
        error: function (req, status, error) {
            console.log(status);
        }
    });
});    