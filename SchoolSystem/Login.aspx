﻿<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Login.aspx.cs" Inherits="SchoolSystem.Login" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>School Management System</title>
    <link href="Content/bootstrap.min.css" rel="stylesheet" />
    <script src="Scripts/popper.min.js"></script>
    <script src="Scripts/jquery-3.7.1.min.js"></script>
    <script src="Scripts/bootstrap.min.js"></script>


    <style>
        .login,.image{
            min-height:100vh;
        }

        .bg-image{
            background-image : url('images/Login.jpg');
            background-size : cover;
            /*background-position:center center;*/
        }
    </style>
</head>
<body>
    <form id="form1" runat="server">
        <div class="container-fluid">
            <div class="row no-gutter">
                <div class="col-md-6 d-none d-md-flex bg-image"></div>
                

                <div class="col-md-6 bg-light">
                    <div class="login d-flex align-items-center py-5">

                        <div class="container">
                            <div class="row">
                                <div class="col-lg-10 col-xl-7 mx-auto">
                                    <h3 class="display-4 pb-3">Sign in</h3>
                                    <p class="text-muted mb-4"> Login page for Admin & Teacher</p>
                                    <div class="form-group mb-3">
                                        <input id="inputEmail" type="email" placeholder="Enter Email" required runat="server" autofocus="" class="form-control rounded-pill border-0 shadow-sm px-4" />
                                    </div>
                                    <div class="form-group mb-3 mb-2">
                                        <input id="inputPassword" type="password" placeholder="Enter Password" required runat="server" class="form-control rounded-pill border-0 shadow-sm px-4 text-primary"  />

                                    </div>

                                    <asp:Button ID="btnLogin" runat="server"  Text="Sign in" CssClass="btn btn-primary btn-block text-uppercase mb-2 rounded-pill shadow-sm" BackColor="#5558c9" OnClick="btnLogin_Click"/>
                                    <div class="text-center d-flex justify-content-between mt-4">
                                        <asp:Label ID="lblMessage" runat="server"></asp:Label>
                                    </div>

                                </div>

                            </div>
                        </div>

                    </div>
                </div>
            </div>
        </div>
    </form>
</body>
</html>
