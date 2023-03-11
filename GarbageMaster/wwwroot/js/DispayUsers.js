$(function () {
    var obj = {
        width: "100%",
        height: 466,
        autoRow: true,
        editable:false,
        resizable: false,
        title: "Users",
        showBottom: true,
        scrollModel: { autoFit: true }
    };
    obj.dataModel = {
        location: "remote", //grid gets data from remote source.
        dataType: "JSON",
        method: "GET",
        url: "/Main/getuserdetails"
    }
    obj.colModel = [
        { title: "First Name", dataType: "string", dataIndx: "FName", width: '10%'},
        { title: "Middle Name", dataType: "string", dataIndx: "MName", width: '10%' },
        { title: "Last Name", dataType: "string", dataIndx: "LName", width: '10%' },
        { title: "Email", dataType: "string", dataIndx: "Email", width: '25%' },
        { title: "Username", dataType: "string", dataIndx: "Username", width: '10%' },
        { title: "Phone", dataType: "string", dataIndx: "PhoneNo", width: '10%' },
        { title: "Password", dataType: "string", dataIndx: "Password", width: '15%' },
        { title: "Ward", dataType: "string", dataIndx: "Ward", width: '9%' }
    ];
    obj.pageModel = { rPP: 20, type: "remote" };
    $("#grid_json").pqGrid(obj);
});    