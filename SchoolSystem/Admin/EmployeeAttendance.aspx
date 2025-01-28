<%@ Page Title="" Language="C#" MasterPageFile="~/Admin/AdminMaster.Master" AutoEventWireup="true" CodeBehind="EmployeeAttendance.aspx.cs" Inherits="SchoolSystem.Admin.EmployeeAttendance" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
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

        <h3 class="text-center">Teacher's Attendance</h3>



        <div class="row mb-3 m-lg-5 ml-lg-5">
            <div class="col-md-12">
                <asp:GridView ID="GVToShowAttendance" runat="server" CssClass="table table-hover table-bordered"  EmptyDataText="No recorde to display..!">
                    <Columns>
                        <asp:TemplateField ControlStyle-Width="20%" HeaderText="Class">
                            <ItemTemplate>
                               <div class="form-check form-check-inline ">
                                   <asp:RadioButton ID="RadioButton1" runat="server" Text="Present" Checked="true" GroupName="Attendance" CssClass="form-check-input" />
                               </div>
                                <div class="form-check form-check-inline">
                                    <asp:RadioButton ID="RadioButton2" runat="server" Text="Absent" GroupName="Attendance" CssClass="form-check-input" />
                                </div>
                            </ItemTemplate>
                            <ItemStyle HorizontalAlign="Center" />
                        </asp:TemplateField>
                       
                    </Columns>
                    <Headerstyle BackColor="#558C9" ForeColor="White" />
                </asp:GridView>

            </div>
        </div>

        <div class="row mb-3 m-lg-5 ml-lg-5">
            <div class="col-md-6 col-lg-4 col-xl-3 col-md-offset-2 mb-3">
                <asp:Button ID="btnMarkAttendance" runat="server" CssClass="btn btn-primary btn-block" BackColor="#5558C9" Text="Mark Attendance" OnClick="btnMarkAttendance_Click" />
            </div>
        </div>

    </div>

</div>



</asp:Content>
