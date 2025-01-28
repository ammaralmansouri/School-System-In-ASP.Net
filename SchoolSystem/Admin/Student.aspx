<%@ Page Title="" Language="C#" MasterPageFile="~/Admin/AdminMaster.Master" AutoEventWireup="true" CodeBehind="Student.aspx.cs" Inherits="SchoolSystem.Admin.Student" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">


                    <div style="background-image:url(''); width:100%; height:720px; background-repeat:no-repeat; background-size:cover; background-attachment:fixed;">
   
    <div class="container p-md-4 p-sm-4">

        <div>
            <asp:Label ID="lblMessage" runat="server"  ></asp:Label>
        </div>
        <h3 class="text-center">Add Students</h3>


        <%--Name and Birthdate--%>
        <div class="row mb-3 m-lg-5 ml-lg-5 mt-md-5">

            <div class="col-md-6">
                <label for="txtStudentName">Student Name</label>
                <asp:TextBox ID="txtStudentName" runat="server" CssClass="form-control" Placeholder="Enter Name"  required></asp:TextBox>
                
                <asp:RegularExpressionValidator ID="RegularExpressionValidator1" runat="server" ErrorMessage="Name should be in charecters" ForeColor="Red" ValidationExpression="^[A-Za-z\s]+$" Display="Dynamic" SetFocusOnError="true" ControlToValidate="txtStudentName"></asp:RegularExpressionValidator>
            </div>


            <div class="col-md-6">
                <label for="txtStudentDateOFBirth">Date of Birth</label>
                <asp:TextBox ID="txtStudentDateOFBirth" runat="server" CssClass="form-control" TextMode="Date"  required></asp:TextBox>
            </div>
        </div>

        <%--Gender And PhoneNummber--%>
        <div class="row mb-3 m-lg-5 ml-lg-5 mt-md-5">

            <div class="col-md-6">
                <label for="DDLStudentGender">Gender</label>
                <asp:DropDownList ID="DDLStudentGender" runat="server" CssClass="form-control">
                    <asp:ListItem Value="1">Male</asp:ListItem>
                    <asp:ListItem Value="2">Female</asp:ListItem>
                </asp:DropDownList>
                
                <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ErrorMessage="Gender is required" ForeColor="Red" ControlToValidate="DDLStudentGender" Display="Dynamic" SetFocusOnError="true" InitialValue="Male"> </asp:RequiredFieldValidator>
            </div>


            <div class="col-md-6">
                <label for="txtStudentPhoneNumber">Teacher Phone Number</label>
                <asp:TextBox ID="txtStudentPhoneNumber" runat="server" CssClass="form-control" TextMode="Number"  PlaceHolder="10 Digits mobie number" required></asp:TextBox>
                <asp:RegularExpressionValidator ID="RegularExpressionValidator2" runat="server" ErrorMessage="Invalid mobile number" ForeColor="Red" ValidationExpression="[0-9]{9}" Display="Dynamic" SetFocusOnError="true" ControlToValidate="txtStudentPhoneNumber"></asp:RegularExpressionValidator>

            </div>
        </div>

        <%--Rool Number and Class--%>
        <div class="row mb-3 m-lg-5 ml-lg-5 mt-md-5">

            <div class="col-md-6">
                <label for="txtStudentRollNumber">Roll Number</label>
                <asp:TextBox ID="txtStudentRollNumber" runat="server" CssClass="form-control" Placeholder="Enter Roll number"  required></asp:TextBox>
        
               
            </div>


            <div class="col-md-6">
                <label for="DDLStudentClass">Class</label>
                <asp:DropDownList ID="DDLStudentClass" runat="server" CssClass="form-control"></asp:DropDownList>
                <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ErrorMessage="Class is required..!" 
                    ControlToValidate="DDLStudentClass" Display="Dynamic" ForeColor="Red" InitialValue="Select classes" 
                    SetFocusOnError="True"></asp:RequiredFieldValidator>
            </div>
        </div>

        <%--Adderss--%>
         <div class="row mb-3 m-lg-5 ml-lg-5 mt-md-5">

                <div class="col-md-12">
                    <label for="txtStudentAddress">Teacher Address</label>
                    <asp:TextBox ID="txtStudentAddress" runat="server" CssClass="form-control" Placeholder="Enter Address" TextMode="MultiLine"  required></asp:TextBox>
 
                </div>
        </div>
    
        <div class="row mb-3 m-lg-5 ml-lg-5">
            <div class="col-md-3 col-md-offset-2 mb-3">
                <asp:Button ID="btnAdd" runat="server" CssClass="btn btn-primary btn-block" BackColor="#5558C9" Text="Add Student" OnClick="btnAdd_Click" />
            </div>
        </div>

        <div class="row mb-3 m-lg-5 ml-lg-5">
            <div class="col-md-12">
                <asp:GridView ID="GVToShowStudents" runat="server" CssClass="table table-hover table-bordered" AllowPaging="True" AutoGenerateColumns="False" PageSize="6" EmptyDataText="No recordes to display..!" DataKeyNames="StudentID" OnPageIndexChanging="GVToShowStudents_PageIndexChanging" OnRowCancelingEdit="GVToShowStudents_RowCancelingEdit" OnRowEditing="GVToShowStudents_RowEditing" OnRowUpdating="GVToShowStudents_RowUpdating" OnRowDataBound="GVToShowStudents_RowDataBound"   >
                    <Columns>
                        <asp:BoundField DataField="Sr.No" HeaderText="Sr.No" ReadOnly="True">
                        <ItemStyle HorizontalAlign="Center" VerticalAlign="Middle" />
                        </asp:BoundField>
                        <asp:TemplateField HeaderText="Student Name">
                            <EditItemTemplate>
                                <asp:TextBox ID="txtStudentName" runat="server" Text='<%# Eval("StudentName") %>'  Width="100px" CssClass="form-control"></asp:TextBox>

                            </EditItemTemplate>
                            <ItemTemplate>
                                <asp:Label ID="lblStudentName" runat="server" Text='<%# Eval("StudentName") %>'></asp:Label>
                            </ItemTemplate>
                            <ItemStyle HorizontalAlign="Center" />
                        </asp:TemplateField>
                        <asp:TemplateField HeaderText="Student Phone Number">
                            <EditItemTemplate>
                                <asp:TextBox ID="txtStudentPhoneNumber" runat="server" Text='<%# Eval("StudentPhoneNumber") %>' Width="100px" CssClass="form-control"></asp:TextBox>
                            </EditItemTemplate>
                            <ItemTemplate>
                                <asp:Label ID="lblStudentPhoneNumber" runat="server" Text='<%# Eval("StudentPhoneNumber") %>'></asp:Label>
                            </ItemTemplate>
                            <ItemStyle HorizontalAlign="Center" VerticalAlign="Middle" />
                        </asp:TemplateField>



                        <asp:TemplateField HeaderText="RoolNumber">
                            <EditItemTemplate>
                                <asp:TextBox ID="txtStudentRollNumber" runat="server" Text='<%# Eval("StudentRollNumber") %>'  Width="100px" CssClass="form-control"></asp:TextBox>
                            </EditItemTemplate>                            
                            <ItemTemplate>
                                <asp:Label ID="lblStudentRollNumber" runat="server" Text='<%# Eval("StudentRollNumber") %>'></asp:Label>
                            </ItemTemplate>
                            <ItemStyle HorizontalAlign="Center" VerticalAlign="Middle" />
                        </asp:TemplateField>


                        <asp:TemplateField HeaderText="Student Class">
                            <EditItemTemplate>
                                <asp:DropDownList ID="DDLClassName" runat="server" CssClass="form-control" Width="120px"></asp:DropDownList>
                            </EditItemTemplate>
                            <ItemTemplate>
                                <asp:Label ID="lblClassName" runat="server" Text='<%# Eval("ClassName") %>'></asp:Label>
                            </ItemTemplate>
                            <ItemStyle HorizontalAlign="Center" VerticalAlign="Middle" />
                        </asp:TemplateField>


                        <asp:TemplateField HeaderText="Student Address">
                            <EditItemTemplate>
                                <asp:TextBox ID="txtStudentAddress" runat="server" Text='<%# Eval("StudentAddress") %>' Width="190px" TextMode="MultiLine" CssClass="form-control"></asp:TextBox>
                            </EditItemTemplate>
                            <ItemTemplate>
                                <asp:Label ID="lblStudentAddress" runat="server" Text='<%# Eval("StudentAddress") %>'></asp:Label>
                            </ItemTemplate>
                            <ItemStyle HorizontalAlign="Center" VerticalAlign="Middle" />
                        </asp:TemplateField>


                        <asp:CommandField CausesValidation="false" HeaderText="Operation"  ShowEditButton="True" ShowDeleteButton="false">
                        <ItemStyle HorizontalAlign="Center" VerticalAlign="Middle" />
                        </asp:CommandField>
                    </Columns>
                    <Headerstyle BackColor="#558C9" ForeColor="White" />

                </asp:GridView>

            </div>
        </div>

    </div>

</div>


</asp:Content>
