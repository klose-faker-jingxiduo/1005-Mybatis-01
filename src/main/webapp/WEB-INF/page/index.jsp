<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page isELIgnored="false" %>
<html>
<head>
    <title>用户列表</title>
    <meta http-equiv="content-type" content="text/html; charset=UTF-8"/>
    <link href="../../css/demo.css" rel="stylesheet" type="text/css"/>

    <script src="../../scripts/boot.js" type="text/javascript"></script>
</head>
<body>
<h2>欢迎页</h2>
<div style="width:800px;">
    <div class="mini-toolbar" style="border-bottom:0;padding:0px;">
        <table style="width:100%;">
            <tr>
                <td style="width:100%;">
                    <a class="mini-button" iconCls="icon-add" onclick="add()">增加</a>
                    <a class="mini-button" iconCls="icon-add" onclick="edit()">编辑</a>
                    <a class="mini-button" iconCls="icon-remove" onclick="remove()">删除</a>
                </td>
                <td style="white-space:nowrap;">
                    <input id="key" class="mini-textbox" emptyText="请输入姓名" style="width:150px;" onenter="onKeyEnter"/>
                    <a class="mini-button" onclick="search()">查询</a>
                </td>
            </tr>
        </table>
    </div>
    <div id="datagrid1" class="mini-datagrid"
         url="/findStudent" style="width: 100%;height: 60%"
         sizeList="[2,5,10]" pageSize="5">

        <div property="columns">
            <%--<div type="indexcolumn"></div>--%>
            <div field="sid" width="120" headerAlign="center" allowSort="true">学生编号</div>

            <div field="sname" width="120" headerAlign="center" allowSort="true">学生姓名</div>

            <div field="spassword" width="120" headerAlign="center" allowSort="true">学生密码</div>
        </div>

    </div>


</div>

<script>
    mini.parse();
    var datagrid = mini.get("datagrid1");
    datagrid.load();

    function search() {
        var key = mini.get("key").getValue();
        grid.load({sname: key});
    }
    function onKeyEnter(e) {
        search();
    }
</script>
</body>
</html>
