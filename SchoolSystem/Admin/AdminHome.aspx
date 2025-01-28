<%@ Page Title="" Language="C#" MasterPageFile="~/Admin/AdminMaster.Master" AutoEventWireup="true" CodeBehind="AdminHome.aspx.cs" Inherits="SchoolSystem.Admin.AdminHome" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <link href="//maxcdn.bootstrapcdn.com/bootstrap/4.1.1/css/bootstrap.min.css" rel="stylesheet" id="bootstrap-css">
    <script src="//maxcdn.bootstrapcdn.com/bootstrap/4.1.1/js/bootstrap.min.js"></script>
    <script src="//cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>

    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.css" />

    <style>
        .card-counter{
        box-shadow: 2px 2px 10px #DADADA;
        margin: 5px;
        padding: 20px 10px;
        background-color: #fff;
        height: 100px;
        border-radius: 5px;
        transition: .3s linear all;
        }

        .card-counter:hover{
        box-shadow: 4px 4px 20px #DADADA;
        transition: .3s linear all;
        }

        .card-counter.primary{
        background-color: #007bff;
        color: #FFF;
        }

        .card-counter.danger{
        background-color: #ef5350;
        color: #FFF;
        }  

        .card-counter.success{
        background-color: #66bb6a;
        color: #FFF;
        }  

        .card-counter.info{
        background-color: #26c6da;
        color: #FFF;
        }  

        .card-counter i{
        font-size: 5em;
        opacity: 0.2;
        }

        .card-counter .count-numbers{
        position: absolute;
        right: 35px;
        top: 20px;
        font-size: 32px;
        display: block;
        }

        .card-counter .count-name{
        position: absolute;
        right: 35px;
        top: 65px;
        font-style: italic;
        text-transform: capitalize;
        opacity: 0.5;
        display: block;
        font-size: 18px;
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
   
    <div style="background-image:url(''); width:100%; height:720px; background-repeat:no-repeat; background-size:cover; background-attachment:fixed;">
       
        <div class="container p-md-4 p-sm-4">

            <div>
                <asp:Label ID="lblMessage" runat="server"  ></asp:Label>
            </div>

             <div class="ml-auto text-end">
                 <asp:ScriptManager ID="ScriptManager1" runat="server"></asp:ScriptManager>
                 <asp:UpdatePanel ID="UpdatePanel1" runat="server">
                     <ContentTemplate>
                         <asp:Timer ID="Timer1" runat="server" OnTick="Timer1_Tick" Interval="1000"></asp:Timer>
                         <asp:Label ID="lblTime" runat="server" Font-Bold="true"></asp:Label>
                     </ContentTemplate>
                 </asp:UpdatePanel>

             </div>

            <h2 class="text-center">Admin Home Page</h2>

        </div>

        <div class="container">
            <div class="row p-4">
            <div class="col-md-3">
              <div class="card-counter primary">
                <i class="fa fa-users"></i>
                <span class="count-numbers"><%Response.Write(Session["Students"]); %></span>
                <span class="count-name">Students</span>
              </div>
            </div>

            <div class="col-md-3">
              <div class="card-counter danger">
                <i class="fa fa-chalkboard-teacher"></i>
                <span class="count-numbers"><%Response.Write(Session["Teachers"]); %></span>
                <span class="count-name">Teachers</span>
              </div>
            </div>

            <div class="col-md-3">
              <div class="card-counter success">
                <i class="fa fa-building"></i>
                <span class="count-numbers"><%Response.Write(Session["Classes"]); %></span>
                <span class="count-name">Classes</span>
              </div>
            </div>

            <div class="col-md-3">
              <div class="card-counter info">
                <i class="fa fa-book"></i>
                <span class="count-numbers"><%Response.Write(Session["Subjects"]); %></span>
                <span class="count-name">Subjects</span>
              </div>
            </div>
          </div>
</div>

        

    
    </div>
</asp:Content>
