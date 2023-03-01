$(function () {
    $.ajax({
        type: "GET",
        url: "/Main/GetWards",
        dataType: "json",
        success: function (result) {
            console.log(result);
            var obj = {
                width: "100%",
                autoRow: true,
                resizable: false,
                title: "This",
                showBottom: false,
                scrollModel: { autoFit: true },
                dataModel: { data: result }
            };
            obj.colModel = [
                { title: "Id", dataType: "integer", dataIndx: "ward", width: '4%', resizable: false },
                { title: "Name", dataType: "string", dataIndx: "name", width: '6%' },
                { title: "Ward", dataType: "integer", align: "right", dataIndx: "ward_no", width: '8%' },
                { title: "Email", dataType: "string", align: "right", dataIndx: "email", width: '22%' },
                { title: "Phone", dataType: "string", align: "right", dataIndx: "phone", width: '10%' },
                { title: "Location", dataType: "string", align: "right", dataIndx: "location", width: '10%' },
                { title: "Population", dataType: "string", align: "right", dataIndx: "population", width: '8%' },
                { title: "Chief", dataType: "string", align: "right", dataIndx: "chief", width: '22%' },
                { title: "ChiefPhone", dataType: "string", align: "right", dataIndx: "chiefphone", width: '9%' }
            ];
            obj.pageModel = { rPP: 32, type: "local" };
            $("#grid_json").pqGrid(obj);
        },
        error: function (req, status, error) {
            console.log(status);
        }
    });
});    