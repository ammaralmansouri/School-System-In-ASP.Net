<%@ Page Title="" Language="C#" MasterPageFile="~/Teacher/TeacherMaster.Master" AutoEventWireup="true" CodeBehind="StudentAttendanceDetails.aspx.cs" Inherits="SchoolSystem.Teacher.StudentAttendanceDetails" %>

<%@ Register Src="~/StudentAttendanceUserControl.ascx" TagPrefix="uc" TagName="StudentAttendance" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    

        <%--    هذا نفس فكرة ال
            Mark Details 
            اللي داخل ال
            teacher
            سير شوف الشرح اللي شرحته وعتفهم--%>

        <uc:StudentAttendance  runat="server" ID="StudentAttendance1" />

    
</asp:Content>
