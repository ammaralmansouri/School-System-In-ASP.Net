<%@ Page Title="" Language="C#" MasterPageFile="~/Admin/AdminMaster.Master" AutoEventWireup="true" CodeBehind="EmpAttendanceDetails.aspx.cs" Inherits="SchoolSystem.Admin.EmpAttendanceDetails" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">


    <div style="background-image:url(''); width:100%; height:720px; background-repeat:no-repeat; background-size:cover; background-attachment:fixed;">
   
    <div class="container p-md-4 p-sm-4">

        <div>
            <asp:Label ID="lblMessage" runat="server"  ></asp:Label>
        </div>
        <h3 class="text-center">Teacher Attendance Details</h3>

        <div class="row mb-3 m-lg-5 ml-lg-5 mt-md-5">

            <div class="col-md-6">
                 <label for="DDLTeachers">Teacher Name</label>
                 <asp:DropDownList ID="DDLTeachers" runat="server" CssClass="form-control" ></asp:DropDownList>
                 <asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" ErrorMessage="Teacher is required..!" 
                     ControlToValidate="DDLTeachers" Display="Dynamic" ForeColor="Red" InitialValue="Select teachers" 
                     SetFocusOnError="True"></asp:RequiredFieldValidator>
            </div>


            <div class="col-md-6">
                <label for="txtMonth">Month</label>
                <asp:TextBox ID="txtMonth" CssClass="form-control" runat="server" TextMode="Date" required></asp:TextBox>
            </div>
         </div>

        <div class="row mb-3 m-lg-5 ml-lg-5">
            <div class="col-md-3 col-md-offset-2 mb-3">
                <asp:Button ID="btnCheckAttendance" runat="server" CssClass="btn btn-primary btn-block" BackColor="#5558C9" Text="Show Attendance Details" OnClick="btnCheckAttendance_Click" />
            </div>
        </div>

        <div class="row mb-3 m-lg-5 ml-lg-5">
            <div class="col-md-12">
                       <asp:GridView ID="GVToShowAttendanceDetails" runat="server" CssClass="table table-hover table-bordered"  AutoGenerateColumns="False"  EmptyDataText="No recordes to display..!">
                           <Columns>

                               <asp:BoundField DataField="Sr.No" HeaderText="Sr.No" >
                               <ItemStyle HorizontalAlign="Center" VerticalAlign="Middle" />
                               </asp:BoundField>

                               <asp:BoundField DataField="TeacherName" HeaderText="Teacher Name" >
                               <ItemStyle HorizontalAlign="Center" VerticalAlign="Middle" />
                               </asp:BoundField>

                               <%--<asp:BoundField DataField="TeacherAttendanceStatus" HeaderText="Teacher Attendance Status" >
                               <ItemStyle HorizontalAlign="Center" VerticalAlign="Middle" />
                               </asp:BoundField>--%>

                               <asp:TemplateField HeaderText="Teacher Attendance Status">
                                   <ItemTemplate>
                                       <asp:Label ID="Label1" runat="server" Text='<%# Boolean.Parse(Eval("TeacherAttendanceStatus").ToString()) ? "Present" : "Absent" %>'></asp:Label>
                                   </ItemTemplate>
                               </asp:TemplateField>

                               <asp:BoundField DataField="TeacherAttendanceDate" HeaderText="Teacher Attendance Date" DataFormatString="{0:dd MMMM yyyy}">
                               <ItemStyle HorizontalAlign="Center" VerticalAlign="Middle" />
                               </asp:BoundField>
         

           
                           </Columns>
                                   <HeaderStyle BackColor="#5558C9" ForeColor="White" />


                    </asp:GridView>
            </div>
        </div>

     </div>
</div>



</asp:Content>
