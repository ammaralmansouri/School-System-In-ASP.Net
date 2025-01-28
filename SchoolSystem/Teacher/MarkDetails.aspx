<%@ Page Title="" Language="C#" MasterPageFile="~/Teacher/TeacherMaster.Master" AutoEventWireup="true" CodeBehind="MarkDetails.aspx.cs" Inherits="SchoolSystem.Teacher.MarksDetails" %>

<%@ Register Src="~/MarksDetailUserControl.ascx" TagPrefix="uc" TagName="MarkDetail" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">

   <%-- <h1>Mark Details</h1>--%>


        <%--    قمنا بانشاء تاج في السطر رقم 3 
            وهذا التاج يقوم باستدعاء الصفحة التي هي محددة في المصدر في السطر الثالث 
            طبعا تلك الصفحة قد فيها الفرونت والباك اند واحنا استدعيناهم بس
            يعني لو تركز ماكتبنا اي كود سي شارب هنا وانما استدعينا تلك الصفحة وقد كل شيء فيها
    
            ونفس هذا الشيء بالضبط عملناه في الادمن لنفس الصفحة .. --%>


    <uc:MarkDetail  runat="server" ID="MarkDetail1" />

        <%--    هذا السطر هو الذي يقوم باستدعاء تلك الصفحة--%>


</asp:Content>
