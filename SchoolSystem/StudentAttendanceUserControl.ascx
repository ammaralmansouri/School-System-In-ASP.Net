<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="StudentAttendanceUserControl.ascx.cs" Inherits="SchoolSystem.StudentAttendanceUserControl" %>


            <div style="background-image:url(''); width:100%; height:720px; background-repeat:no-repeat; background-size:cover; background-attachment:fixed;">
   
    <div class="container p-md-4 p-sm-4">

        <div>
            <asp:Label ID="lblMessage" runat="server"  ></asp:Label>
        </div>

        <h3 class="text-center">Student Attendance Details</h3>



        <div class="row mb-3 m-lg-5 ml-lg-5 mt-md-5">

            <div class="col-md-6">
                <label for="DDLClasses">Classes</label>
                <asp:DropDownList ID="DDLClasses" runat="server" CssClass="form-control" AutoPostBack="true" OnSelectedIndexChanged="DDLClasses_SelectedIndexChanged"></asp:DropDownList>
                <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ErrorMessage="Class is required..!" 
                    ControlToValidate="DDLClasses" Display="Dynamic" ForeColor="Red" InitialValue="Select classes" 
                    SetFocusOnError="True"></asp:RequiredFieldValidator>
            </div>


            <div class="col-md-6">
                <label for="DDLSubjects">Subject Name</label>
                <asp:DropDownList ID="DDLSubjects" runat="server" CssClass="form-control" ></asp:DropDownList>
                <%--<asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ErrorMessage="Subject is required..!" 
                    ControlToValidate="DDLSubjects" Display="Dynamic" ForeColor="Red" InitialValue="Select Subjects" 
                    SetFocusOnError="True"></asp:RequiredFieldValidator>--%>
            </div>
         </div>



        <div class="row mb-3 m-lg-5 ml-lg-5 mt-md-5">

            <div class="col-md-6">
                <label for="txtStudentRollNumber">Student Roll Number</label>
                <asp:TextBox ID="txtStudentRollNumber" runat="server" CssClass="form-control" placeholder="Enter Student Roll Number"></asp:TextBox>
                <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ErrorMessage="Student Roll Nummber is required..!" 
                    ControlToValidate="txtStudentRollNumber" Display="Dynamic" ForeColor="Red"  
                    SetFocusOnError="True" ></asp:RequiredFieldValidator>
            </div>


            <div class="col-md-6">
                <label for="txtMonth">Month</label>
                <asp:TextBox ID="txtMonth" runat="server" CssClass="form-control" TextMode="Date"></asp:TextBox>
                <asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" ErrorMessage="Month is required..!" 
                    ControlToValidate="txtMonth" Display="Dynamic" ForeColor="Red"  
                    SetFocusOnError="True"></asp:RequiredFieldValidator>
            </div>
         </div>

        <div class="row mb-3 m-lg-5 ml-lg-5">
            <div class="col-md-3 col-md-offset-2 mb-3">
                <asp:Button ID="btnCheckAttendance" runat="server" CssClass="btn btn-primary btn-block" BackColor="#5558C9" Text="Check Attendance" OnClick="btnCheckAttendance_Click" />
            </div>
        </div>





        <div class="row mb-3 m-lg-5 ml-lg-5">
            <div class="col-md-12">
                  <asp:GridView ID="GVToShowAttendanceDetails" runat="server" CssClass="table table-hover table-bordered"  AutoGenerateColumns="False"  EmptyDataText="No recordes to display..!">
                       <Columns>

                           <asp:BoundField DataField="Sr.No" HeaderText="Sr.No" >
                           <ItemStyle HorizontalAlign="Center" VerticalAlign="Middle" />
                           </asp:BoundField>

                           <asp:BoundField DataField="StudentName" HeaderText="Student Name" >
                           <ItemStyle HorizontalAlign="Center" VerticalAlign="Middle" />
                           </asp:BoundField>

                           <asp:BoundField DataField="SubjectName" HeaderText="Subject Name" >
                            <ItemStyle HorizontalAlign="Center" VerticalAlign="Middle" />
                            </asp:BoundField>

                           <%--<asp:BoundField DataField="TeacherAttendanceStatus" HeaderText="Teacher Attendance Status" >
                           <ItemStyle HorizontalAlign="Center" VerticalAlign="Middle" />
                           </asp:BoundField>--%>

                           <asp:TemplateField HeaderText="Student Attendance Status">
                               <ItemTemplate>
                                   <asp:Label ID="Label1" runat="server" Text='<%# Boolean.Parse(Eval("StudentAttendanceStatus").ToString()) ? "Present" : "Absent" %>'></asp:Label>
                               </ItemTemplate>
                           </asp:TemplateField>

                           <asp:BoundField DataField="StudentAttendanceDate" HeaderText="Student Attendance Date" DataFormatString="{0:dd MMMM yyyy}">
                           <ItemStyle HorizontalAlign="Center" VerticalAlign="Middle" />
                           </asp:BoundField>
         

           
                       </Columns>
                               <HeaderStyle BackColor="#5558C9" ForeColor="White" />


                </asp:GridView>

        </div>
        </div>

    </div>

</div>