<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ include file="/commons/global.jsp" %>
<!DOCTYPE html>
<html>
<head>
    <%@ include file="/commons/basejs.jsp" %>
    <meta http-equiv="X-UA-Compatible" content="edge"/>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <title>出货管理</title>
</head>
<body class="easyui-layout" data-options="fit:true,border:false">
<div data-options="region:'center',border:true,title:'出货单列表'">
    <table id="dataGrid" data-options="fit:true,border:false"></table>
</div>
<script src="${path }/static/js/formatTime.js"></script>
<script>
    var dataGrid;
    $(function () {
        dataGrid = $('#dataGrid').datagrid({
            url: '${path }/shipment/dataGrid',
            fit: true,
            striped: true,
            rownumbers: true,
            pagination: true,
            singleSelect: true,
            height: '27',
            idField: 'id',
            sortName: 'shTime',
            sortOrder: 'asc',
            pageSize: 20,
            pageList: [10, 20, 30, 40, 50, 100, 200, 300, 400, 500],
            columns: [[{
                width: '80',
                title: '出货单编号',
                field: 'shStoreid',
                sortable: true
            }, {
                width: '80',
                title: '货主编号',
                field: 'shStoreid',
                sortable: true
            }, {
                width: '80',
                title: '实际出货时间',
                field: 'shTime',
                sortable: true,
                formatter: formatDatebox
            }, {
                field: 'action',
                title: '操作',
                width: 130,
                formatter: function (value, row, index) {
                    var str = '';
                    <shiro:hasPermission name="/user/edit">
                    str += $.formatString('<a href="javascript:void(0)" class="user-easyui-linkbutton-edit" data-options="plain:true,iconCls:\'icon-edit\'" onclick="editFun(\'{0}\');" >编辑</a>', row.id);
                    </shiro:hasPermission>
                    <shiro:hasPermission name="/user/delete">
                    str += '&nbsp;&nbsp;|&nbsp;&nbsp;';
                    str += $.formatString('<a href="javascript:void(0)" class="user-easyui-linkbutton-del" data-options="plain:true,iconCls:\'icon-del\'" onclick="deleteFun(\'{0}\');" >删除</a>', row.id);
                    </shiro:hasPermission>
                    return str;
                }
            }]],
            onLoadSuccess: function (data) {
                $('.user-easyui-linkbutton-edit').linkbutton({text: '编辑', plain: true, iconCls: 'icon-edit'});
                $('.user-easyui-linkbutton-del').linkbutton({text: '删除', plain: true, iconCls: 'icon-del'});
            },
            toolbar: '#toolbar'
        });
    });
</script>
</body>
</html>
