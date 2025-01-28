<%@ Page Title="" Language="C#" MasterPageFile="~/Admin/AdminMaster.Master" AutoEventWireup="true" CodeBehind="MarkDetails.aspx.cs" Inherits="SchoolSystem.Admin.MarkDetails" %>

<%@ Register Src="~/MarksDetailUserControl.ascx" TagPrefix="uc" TagName="MarkDetail" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">



    
        <%--    قمنا بانشاء تاج في السطر رقم 3 
            وهذا التاج يقوم باستدعاء الصفحة التي هي محددة في المصدر في السطر الثالث 
            طبعا تلك الصفحة قد فيها الفرونت والباك اند واحنا استدعيناهم بس
            يعني لو تركز ماكتبنا اي كود سي شارب هنا وانما استدعينا تلك الصفحة وقد كل شيء فيها
    
            ونفس هذا الشيء بالضبط عملناه في التيتشر لنفس الصفحة .. --%>


    <uc:MarkDetail  runat="server" ID="MarkDetail1" />

        <%--    هذا السطر هو الذي يقوم باستدعاء تلك الصفحة--%>


       <%--     <div style="background-image:url(''); width:100%; height:720px; background-repeat:no-repeat; background-size:cover; background-attachment:fixed;">
   
    <div class="container p-md-4 p-sm-4">

        <div>
            <asp:Label ID="lblMessage" runat="server"  ></asp:Label>
        </div>
        <h3 class="text-center">Marks Detailes</h3>

        <div class="row mb-3 m-lg-5 ml-lg-5 mt-md-5">

            <div class="col-md-6">
                <label for="txtClassName">Classes</label>
                <asp:DropDownList ID="DDLClasses" runat="server" CssClass="form-control"></asp:DropDownList>
                <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ErrorMessage="Class is required..!" 
                    ControlToValidate="DDLClasses" Display="Dynamic" ForeColor="Red" InitialValue="select classes" 
                    SetFocusOnError="True"></asp:RequiredFieldValidator>
            </div>


            <div class="col-md-6">
                <label for="txtStudentRollNumber">Student Roll Number</label>
                <asp:TextBox ID="txtStudentRollNumber" runat="server" CssClass="form-control" Placeholder="Enter Student Roll Number"  required></asp:TextBox>
            </div>
        </div>


    
        <div class="row mb-3 m-lg-5 ml-lg-5">
            <div class="col-md-3 col-md-offset-2 mb-3">
                <asp:Button ID="btnAdd" runat="server" CssClass="btn btn-primary btn-block" BackColor="#5558C9" Text="Get Marks" OnClick="btnAdd_Click"  />
            </div>
        </div>

        <div class="row mb-3 m-lg-5 ml-lg-5">
            <div class="col-md-12">
                <asp:GridView ID="GVToShowMarks" runat="server" CssClass="table table-hover table-bordered" AllowPaging="True" AutoGenerateColumns="False" PageSize="8" EmptyDataText="No recordes to display..!"  OnPageIndexChanging="GVToShowMarks_PageIndexChanging">
                    <Columns>
                        <asp:BoundField DataField="Sr.No" HeaderText="Sr.No">
                        <ItemStyle HorizontalAlign="Center" VerticalAlign="Middle" />
                        </asp:BoundField>

                        <asp:BoundField DataField="ExamID" HeaderText="ExamID">
                        <ItemStyle HorizontalAlign="Center" VerticalAlign="Middle" />
                        </asp:BoundField>

                        <asp:BoundField DataField="ClassName" HeaderText="Class" >
                        <ItemStyle HorizontalAlign="Center" VerticalAlign="Middle" />
                        </asp:BoundField>


                        <asp:BoundField DataField="SubjectName" HeaderText="Subject" >
                        <ItemStyle HorizontalAlign="Center" VerticalAlign="Middle" />
                        </asp:BoundField>

                        <asp:BoundField DataField="ExamRollNumber" HeaderText="Roll Number" >
                        <ItemStyle HorizontalAlign="Center" VerticalAlign="Middle" />
                        </asp:BoundField>

                        <asp:BoundField DataField="ExamTotalMarks" HeaderText="Exam Total Marks" >
                        <ItemStyle HorizontalAlign="Center" VerticalAlign="Middle" />
                        </asp:BoundField>

                        <asp:BoundField DataField="ExamOutOfMarks" HeaderText="Exam Out Of Marks" >
                        <ItemStyle HorizontalAlign="Center" VerticalAlign="Middle" />
                        </asp:BoundField>
                        

                       
                    </Columns>
                    <Headerstyle BackColor="#558C9" ForeColor="White" />

                </asp:GridView>

            </div>
        </div>

    </div>

</div>--%>


        <%--    السطر هذا معمول له تعليق عشان تشوف بس
            ولو ابعدت التعليق بيظهر خطأ 
            لأن كل شيء مثل ماقلت لك .. قده في صفحة ثانية--%>


 <%--   الكود هذا كامل يقوم بنفس عمل السطر رقم 19
    ولكن مثل ماقلت احنا بس نقلنا كل شيء لصفحة ثانية واستدعيناها هانا ومن داخل التيتشرز والكل--%>


</asp:Content>
