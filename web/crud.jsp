<%--
  Created by IntelliJ IDEA.
  User: Administrator
  Date: 2020/2/24 0024
  Time: 19:45
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
    <link rel="stylesheet" href="https://cdn.staticfile.org/twitter-bootstrap/3.3.7/css/bootstrap.min.css">
    <script src="https://cdn.staticfile.org/jquery/2.1.1/jquery.min.js"></script>
    <script src="https://cdn.staticfile.org/twitter-bootstrap/3.3.7/js/bootstrap.min.js"></script>
</head>
<body>
<input type='button' data-toggle='modal' data-target='#addUserModel' value='添加' class='btn btn-primary btn-large'>
<table class="table table-bordered" id="tab">
    <thead>
    <tr class="success">
        <th>编号</th>
        <th>姓名</th>
        <th>邮箱</th>
        <th>角色</th>
        <th colspan="3">操作</th>
    </tr>
    </thead>
</table>
<script>
   $.ajax({
        url:'/selectAllUserJson',
        success:function (data) {
            console.log(data);
            var users = eval('('+data+')');
           //两种方法皆可
/*
            var users=JSON.parse(data);
*/
            console.log(data);
            console.log(users);
            var str="";
           for(var i=0;i<users.length;i++){
             str+="<tr>";
             str+="<td>"+users[i].id+"</td>";
             str+="<td>"+users[i].userName+"</td>";
             str+="<td>"+users[i].email+"</td>";
             str+="<td>"+users[i].roleName+"</td>";
             str+="<td><input type='button' value='删除' class='btn btn-primary btn-xs' onclick='del("+users[i].id+")'>";
             str+="&nbsp&nbsp";
             str+="<input type='button'  value='更新' data-toggle='modal' data-target='#updDUserModel' onclick='selectUser("+users[i].id+")' class='btn btn-primary btn-xs'>";
               str+="&nbsp&nbsp";
               str+="<input type='button' data-toggle='modal' data-target='#updUserModel' value='查看' onclick='selectUserById("+users[i].id+")' class='btn btn-primary btn-xs'></td>";
               str+="</tr>";
         }+
           $("#tab").append(str);
        }
    })
    /*$.ajax({
        url:'/selectAllUserJson',
        success:function (data) {

            console.log(JSON.stringify(data));
            alert(JSON.stringify(data));

            /!*
            var users = eval('('+data+')');
*!/
            //两种方法皆可
            /!*
                        var users=JSON.parse(data);
            *!/
            var str="";
            for(var i=0;i<data.length;i++){
                str+="<tr>";
                str+="<td>"+data[i].id+"</td>";
                str+="<td>"+data[i].userName+"</td>";
                str+="<td>"+data[i].email+"</td>";
                str+="<td>"+data[i].roleName+"</td>";
                str+="<td><input type='button' value='删除' class='btn btn-primary btn-xs' onclick='del("+data[i].id+")'>";
                str+="&nbsp&nbsp";
                str+="<input type='button'  value='更新' data-toggle='modal' data-target='#updDUserModel' onclick='selectUser("+data[i].id+")' class='btn btn-primary btn-xs'>";
                str+="&nbsp&nbsp";
                str+="<input type='button' data-toggle='modal' data-target='#updUserModel' value='查看' onclick='selectUserById("+data[i].id+")' class='btn btn-primary btn-xs'></td>";
                str+="</tr>";
            }+
                $("#tab").append(str);
        }
    })*/
    function del(uid) {
        $.ajax({
            url:"/deleteUser/"+uid,
/*
            data:'{id:'+uid+'}',
*/
            type:'get',
            success:function (data) {
                console.log(data);
                if(data==1){
                    window.location.reload();
                }else{
                    alert("删除失败");
                }
            }
        })
    }
    function addUser() {
        var username=$('#userName').val();
        var userpassword=$('#userPassword').val();
        var email=$('#email').val();
        var role=$('input:radio[name="roleName"]:checked').val();
        console.log(role);
        $.ajax({
            url:'${pageContext.request.contextPath}/saveUser',
            type:'post',
            data: "userName=" + username + "&userPassword=" + userpassword + "&email=" + email+"&roleName="+role,
            success:function (data) {
                if (data==1) {
                  window.location.reload();
                }else{
                       alert("添加失败");
                }
            }
        })
    }
    function selectUserById(uid) {
        /*
                var dataid={id:uid};
        */
        $.ajax({
            url:'${PageContext.request.contextPath}/selectUserById/'+uid,
            /*
                        data:dataid,
            */
            success:function (data) {
                console.log(data);
                var res=eval('('+data+')');
                $('#updname').val(res.userName);
                $('#updpassword').val(res.userPassword);
                $('#updemail').val(res.email);
                if (res.roleName == '管理员') {
                    document.getElementById('role1').checked = true;
                } else {
                    document.getElementById('role2').checked = true;
                }
            }
        })

    }
    function  updateUser() {
/*
        var user=new FormData($('#updDuserForm')[0])
*/       var userId=$('#updDId').val();
        var username=$('#updDname').val();
        var userpassword=$('#updDpassword').val();
        var email=$('#updDemail').val();
        var role=$('input:radio[name="roleName"]:checked').val();
        $.ajax({
            url:'/updateUser',
            data: "id="+userId+"&userName=" + username + "&userPassword=" + userpassword + "&email=" + email+"&roleName="+role,
            type:'post',
            success:function (data) {
                if(data==1){
                    alert("更新成功");
                    window.location.reload();
                }else{
                    alert("更新失败");
                    window.location.reload();
                }
            }
        })
    }
    function selectUser(uid) {
        /*
                var dataid={id:uid};
        */
        $.ajax({
            url:'${PageContext.request.contextPath}/selectUserById/'+uid,
            /*
                        data:dataid,
            */
            success:function (data) {
                console.log(data);
                var res=eval('('+data+')');
                $('#updDId').val(res.id);
                $('#updDname').val(res.userName);
                $('#updDpassword').val(res.userPassword);
                $('#updDemail').val(res.email);
                if (res.roleName == '管理员') {
                    document.getElementById('role1').checked = true;
                } else {
                    document.getElementById('role2').checked = true;
                }
            }
        })

    }
</script>
<div class="modal fade" id="addUserModel" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
    <div class="modal-dialog">
        <div class="modal-content">
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal" aria-hidden="true">
                    &times;
                </button>
                <h4 class="modal-title" id="myModalLabel">
                   用户添加   </h4>
            </div>
            <div class="modal-body">
                <form class="form-horizontal" role="form" id="adduserForm">
                    <div class="form-group">
                        <label for="userName" class="col-sm-2 control-label">名字</label>
                        <div class="col-sm-10">
                            <input type="text" class="form-control" name="userName" id="userName"
                                   placeholder="请输入名字">
                        </div>
                    </div>
                    <div class="form-group">
                        <label for="userPassword" class="col-sm-2 control-label">密码</label>
                        <div class="col-sm-10">
                            <input type="password" class="form-control" name="userPassword" id="userPassword"
                                   placeholder="请输入密码">
                        </div>
                    </div>
                    <div class="form-group">
                    <label for="email" class="col-sm-2 control-label">邮箱</label>
                    <div class="col-sm-10">
                        <input type="text" class="form-control" name="email" id="email"
                               placeholder="请输入邮箱">
                    </div>
                </div>
                    <div class="radio">
                        <div class="col-sm-10">
                        <label> <input type="radio" name="roleName" id="roles1" value="管理员" checked> 管理员</label>
                           <label><input type="radio" name="roleName" id="roles2" value="普通用户">普通用户</label>
                        </div>
                    </div>
                </form>
            </div>
            <div class="modal-footer">
                <button type="button" class="btn btn-default" data-dismiss="modal">关闭
                </button>
                <button type="button" class="btn btn-primary" onclick="checkNull()">
                    添加
                </button>
            </div>
        </div><!-- /.modal-content -->
    </div><!-- /.modal -->
</div>

<div class="modal fade" id="updDUserModel" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
    <div class="modal-dialog">
        <div class="modal-content">
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal" aria-hidden="true">
                    &times;
                </button>
                <h4 class="modal-title" id="updDmyModalLabel">
                    用户更新   </h4>
            </div>
            <div class="modal-body">
                <form class="form-horizontal" role="form" id="updDuserForm">
                    <div class="form-group">
                        <label for="updDId" class="col-sm-2 control-label">编号</label>
                        <div class="col-sm-10">
                            <input type="hidden" class="form-control" name="id" id="updDId"
                                   placeholder="请输入邮箱">
                        </div>
                    </div>
                    <div class="form-group">
                        <label for="updDname" class="col-sm-2 control-label">名字</label>
                        <div class="col-sm-10">
                            <input type="text" class="form-control" name="userName" id="updDname"
                                   placeholder="请输入名字">
                        </div>
                    </div>
                    <div class="form-group">
                        <label for="updDpassword" class="col-sm-2 control-label">密码</label>
                        <div class="col-sm-10">
                            <input type="password" class="form-control" name="userPassword" id="updDpassword"
                                   placeholder="请输入密码">
                        </div>
                    </div>
                    <div class="form-group">
                        <label for="updDemail" class="col-sm-2 control-label">邮箱</label>
                        <div class="col-sm-10">
                            <input type="text" class="form-control" name="email" id="updDemail"
                                   placeholder="请输入邮箱">
                        </div>
                    </div>
                    <div class="radio">
                        <div class="col-sm-10" id="updDrole">
                            <label> <input type="radio" name="roleName"  value="管理员" checked> 管理员</label>
                            <label><input type="radio" name="roleName"   value="普通用户">普通用户</label>
                        </div>
                    </div>
                </form>
            </div>
            <div class="modal-footer">
                <button type="button" class="btn btn-default" data-dismiss="modal" onclick="clearForm()">清空
                </button>
                <button type="button" class="btn btn-primary" onclick="checkUNull()">
                    更新
                </button>
            </div>
        </div><!-- /.modal-content -->
    </div><!-- /.modal -->
</div>
<div class="modal fade" id="updUserModel" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
    <div class="modal-dialog">
        <div class="modal-content">
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal" aria-hidden="true">
                    &times;
                </button>
                <h4 class="modal-title" id="updmyModalLabel">
                    用户查看   </h4>
            </div>
            <div class="modal-body">
                <form class="form-horizontal" role="form" id="upduserForm">
                    <div class="form-group">
                        <label for="updname" class="col-sm-2 control-label">名字</label>
                        <div class="col-sm-10">
                            <input type="text" class="form-control" name="userName" id="updname"
                                   placeholder="请输入名字">
                        </div>
                    </div>
                    <div class="form-group">
                        <label for="updpassword" class="col-sm-2 control-label">密码</label>
                        <div class="col-sm-10">
                            <input type="password" class="form-control" name="userPassword" id="updpassword"
                                   placeholder="请输入密码">
                        </div>
                    </div>
                    <div class="form-group">
                        <label for="updemail" class="col-sm-2 control-label">邮箱</label>
                        <div class="col-sm-10">
                            <input type="text" class="form-control" name="email" id="updemail"
                                   placeholder="请输入邮箱">
                        </div>
                    </div>
                    <div class="radio">
                        <div class="col-sm-10" id="updrole">
                            <label> <input type="radio" name="roleName"  value="管理员" checked> 管理员</label>
                            <label><input type="radio" name="roleName"   value="普通用户">普通用户</label>
                        </div>
                    </div>
                </form>
            </div>
        </div><!-- /.modal-content -->
    </div><!-- /.modal -->
</div>
</body>
<script>
    /* 非空验证 */
    function checkUNull() {
        if ($("#updDname").val() == ""
            || $("#updDpassword").val() == ""||$("#updDemail").val()=="") {
            alert("       '" + $(this).attr("placeholder") + "' 不能为空！\r\n");
            return false;
        } else {
            updateUser();
            return true;
        }
    }
    function checkNull() {
        if ($("#userName").val() == ""
            || $("#userPassword").val() == ""||$("#email").val()=="") {
            alert("       '" + $(this).attr("placeholder") + "' 不能为空！\r\n");
            return false;
        } else {
            addUser();
            return true;
        }
    }
    //清空表单
    function clearForm(){
        $('#updname').val("");
        $('#updpassword').val("");
        $('#updemail').val("");
    }
</script>
</html>
