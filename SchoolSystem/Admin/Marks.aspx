<%@ Page Title="" Language="C#" MasterPageFile="~/Admin/AdminMaster.Master" AutoEventWireup="true" CodeBehind="Marks.aspx.cs" Inherits="SchoolSystem.Admin.Marks" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">


    <div style="background-image:url(''); width:100%; height:720px; background-repeat:no-repeat; background-size:cover; background-attachment:fixed;">
   
    <div class="container p-md-4 p-sm-4">

        <div>
            <asp:Label ID="lblMessage" runat="server"  ></asp:Label>
        </div>
        <h3 class="text-center">Add Marks</h3>

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
                <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ErrorMessage="Subject is required..!" 
                    ControlToValidate="DDLSubjects" Display="Dynamic" ForeColor="Red" InitialValue="Select Subjects" 
                    SetFocusOnError="True"></asp:RequiredFieldValidator>
            </div>


            <div class="col-md-6 mt-2">
                <label for="txtRollNumber">Student Roll Number</label>
                <asp:TextBox ID="txtRollNumber" runat="server" CssClass="form-control" placeHolder="Enter Student Roll Number" required></asp:TextBox>
 
            </div>


             <div class="col-md-12 mt-2">
                  <div class="col-md-6 mt-2">
                         <label for="txtStudentTotalMarks">Total Marks</label>
                         <asp:TextBox ID="txtStudentTotalMarks" runat="server" CssClass="form-control" placeHolder="Enter Total Marks" TextMode="Number" required></asp:TextBox>
 
                     </div>

                    <div class="col-md-6 mt-2">
                        <label for="txtOutOfMarks">Out Of Marks</label>
                        <asp:TextBox ID="txtOutOfMarks" runat="server" CssClass="form-control" placeHolder="Enter Out Of Marks" TextMode="Number" required></asp:TextBox>
 
                    </div>
             </div>

            
         </div>

        <div class="row mb-3 m-lg-5 ml-lg-5">
            <div class="col-md-3 col-md-offset-2 mb-3">
                <asp:Button ID="btnAdd" runat="server" CssClass="btn btn-primary btn-block" BackColor="#5558C9" Text="Add Mark" OnClick="btnAdd_Click" />
            </div>
        </div>

        <div class="row mb-3 m-lg-5 ml-lg-5">
            <div class="col-md-10">
                <asp:GridView ID="GVToShowMarks" runat="server" CssClass="table table-hover table-bordered" AllowPaging="True" AutoGenerateColumns="False" PageSize="6" EmptyDataText="No recordes to display..!" DataKeyNames="ExamID" OnPageIndexChanging="GVToShowMarks_PageIndexChanging" OnRowCancelingEdit="GVToShowMarks_RowCancelingEdit" OnRowDataBound="GVToShowMarks_RowDataBound" OnRowEditing="GVToShowMarks_RowEditing" OnRowUpdating="GVToShowMarks_RowUpdating"  >
                <Columns>
                    <asp:BoundField DataField="Sr.No" HeaderText="Sr.No" ReadOnly="True">
                    <ItemStyle HorizontalAlign="Center" VerticalAlign="Middle" />
                    </asp:BoundField>
                    <asp:TemplateField HeaderText="Class">
                        <EditItemTemplate>
                            <asp:DropDownList ID="DDLClassesGV" runat="server" DataSourceID="SqlDataSource1" DataTextField="ClassName" DataValueField="ClassID" SelectedValue='<%# Eval("ClassID") %>' CssClass="form-control" AutoPostBack="true" OnSelectedIndexChanged="DDLClassesGV_SelectedIndexChanged">
                            <asp:ListItem>Select Classes</asp:ListItem>
                            </asp:DropDownList>
                            <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:SchoolSystemConnectionString %>"  SelectCommand="SELECT * FROM [classes]"></asp:SqlDataSource>
                        </EditItemTemplate>
                        <ItemTemplate>
                            <asp:Label ID="Label2" runat="server" Text='<%# Eval("ClassName") %>'></asp:Label>
                        </ItemTemplate>
                        <ItemStyle HorizontalAlign="Center" />
                    </asp:TemplateField>



                    <asp:TemplateField HeaderText="Subject">
                        <EditItemTemplate>
                            <<asp:DropDownList ID="DDLSubjectsGV" runat="server"  CssClass="form-control"  >
                            </asp:DropDownList>
                        </EditItemTemplate>
                        <ItemTemplate>
                            <asp:Label ID="Label1" runat="server" Text='<%# Eval("SubjectName") %>'></asp:Label>
                        </ItemTemplate>
                        <ItemStyle HorizontalAlign="Center" VerticalAlign="Middle" />
                    </asp:TemplateField>


                    <asp:TemplateField HeaderText="Roll Number">
                        <EditItemTemplate>
                            <asp:TextBox ID="txtRollNumberGV" runat="server" CssClass="form-control"  Text='<%# Eval("ExamRollNumber") %>'></asp:TextBox>
                        </EditItemTemplate>
                        <ItemTemplate>
                            <asp:Label ID="Label2" runat="server" Text='<%# Eval("ExamRollNumber") %>'></asp:Label>
                        </ItemTemplate>
                        <ItemStyle HorizontalAlign="Center" />
                    </asp:TemplateField>


                    <asp:TemplateField HeaderText="Total Marks">
                        <EditItemTemplate>
                            <asp:TextBox ID="txtStudentMarksGV" runat="server" CssClass="form-control"  Text='<%# Eval("ExamTotalMarks") %>'></asp:TextBox>
                        </EditItemTemplate>
                        <ItemTemplate>
                            <asp:Label ID="Label2" runat="server" Text='<%# Eval("ExamTotalMarks") %>'></asp:Label>
                        </ItemTemplate>
                        <ItemStyle HorizontalAlign="Center" />
                    </asp:TemplateField>


                     <asp:TemplateField HeaderText="Out Of Marks">
                         <EditItemTemplate>
                             <asp:TextBox ID="txtOutOfMarksGV" runat="server" CssClass="form-control"  Text='<%# Eval("ExamOutOfMarks") %>'></asp:TextBox>
                         </EditItemTemplate>
                         <ItemTemplate>
                             <asp:Label ID="Label2" runat="server" Text='<%# Eval("ExamOutOfMarks") %>'></asp:Label>
                         </ItemTemplate>
                         <ItemStyle HorizontalAlign="Center" />
                     </asp:TemplateField>


                    <asp:CommandField CausesValidation="false" HeaderText="Operation"  ShowEditButton="True">
                    <ItemStyle HorizontalAlign="Center" VerticalAlign="Middle" />
                    </asp:CommandField>
                </Columns>
                 <Headerstyle BackColor="#5558C9" ForeColor="White" />

         </asp:GridView>
            </div>
        </div>

     </div>
</div>


</asp:Content>
