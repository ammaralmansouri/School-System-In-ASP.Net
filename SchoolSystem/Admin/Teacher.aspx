<%@ Page Title="" Language="C#" MasterPageFile="~/Admin/AdminMaster.Master" AutoEventWireup="true" CodeBehind="Teacher.aspx.cs" Inherits="SchoolSystem.Admin.Teacher" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">


                <div style="background-image:url(''); width:100%; height:720px; background-repeat:no-repeat; background-size:cover; background-attachment:fixed;">
   
    <div class="container p-md-4 p-sm-4">

        <div>
            <asp:Label ID="lblMessage" runat="server"  ></asp:Label>
        </div>
        <h3 class="text-center">Add Techers</h3>


        <%--Name and Birthdate--%>
        <div class="row mb-3 m-lg-5 ml-lg-5 mt-md-5">

            <div class="col-md-6">
                <label for="txtTeacherName">Teacher Name</label>
                <asp:TextBox ID="txtTeacherName" runat="server" CssClass="form-control" Placeholder="Enter Name"  required></asp:TextBox>
                
                <asp:RegularExpressionValidator ID="RegularExpressionValidator1" runat="server" ErrorMessage="Name should be in charecters" ForeColor="Red" ValidationExpression="^[A-Za-z\s]+$" Display="Dynamic" SetFocusOnError="true" ControlToValidate="txtTeacherName"></asp:RegularExpressionValidator>
            </div>


            <div class="col-md-6">
                <label for="txtTeacherDateOFBirth">Date of Birth</label>
                <asp:TextBox ID="txtTeacherDateOFBirth" runat="server" CssClass="form-control" TextMode="Date"  required></asp:TextBox>
            </div>
        </div>

        <%--Gender And PhoneNummber--%>
        <div class="row mb-3 m-lg-5 ml-lg-5 mt-md-5">

            <div class="col-md-6">
                <label for="DDLTeacherGender">Gender</label>
                <asp:DropDownList ID="DDLTeacherGender" runat="server" CssClass="form-control">
                    <asp:ListItem Value="1">Male</asp:ListItem>
                    <asp:ListItem Value="2">Female</asp:ListItem>
                </asp:DropDownList>
                
                <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ErrorMessage="Gender is required" ForeColor="Red" ControlToValidate="DDLTeacherGender" Display="Dynamic" SetFocusOnError="true" InitialValue="Male"> </asp:RequiredFieldValidator>
            </div>


            <div class="col-md-6">
                <label for="txtTeacherPhoneNumber">Teacher Phone Number</label>
                <asp:TextBox ID="txtTeacherPhoneNumber" runat="server" CssClass="form-control" TextMode="Number"  PlaceHolder="10 Digits mobie number" required></asp:TextBox>
                <asp:RegularExpressionValidator ID="RegularExpressionValidator2" runat="server" ErrorMessage="Invalid mobile number" ForeColor="Red" ValidationExpression="[0-9]{9}" Display="Dynamic" SetFocusOnError="true" ControlToValidate="txtTeacherPhoneNumber"></asp:RegularExpressionValidator>

            </div>
        </div>

        <%--Email and Password--%>
        <div class="row mb-3 m-lg-5 ml-lg-5 mt-md-5">

            <div class="col-md-6">
                <label for="txtTeacherEmail">Teacher Email</label>
                <asp:TextBox ID="txtTeacherEmail" runat="server" CssClass="form-control" Placeholder="Enter Email" TextMode="Email" required></asp:TextBox>
        
               
            </div>


            <div class="col-md-6">
                <label for="txtTeachePassword">Teacher password</label>
                <asp:TextBox ID="txtTeachePassword" runat="server" CssClass="form-control" Placeholder="Enter Password"  TextMode="Password" required></asp:TextBox>
            </div>
        </div>

        <%--Adderss--%>
         <div class="row mb-3 m-lg-5 ml-lg-5 mt-md-5">

                <div class="col-md-12">
                    <label for="txtTeacherAddress">Teacher Address</label>
                    <asp:TextBox ID="txtTeacherAddress" runat="server" CssClass="form-control" Placeholder="Enter Address" TextMode="MultiLine"  required></asp:TextBox>
 
                </div>
        </div>
    
        <div class="row mb-3 m-lg-5 ml-lg-5">
            <div class="col-md-3 col-md-offset-2 mb-3">
                <asp:Button ID="btnAdd" runat="server" CssClass="btn btn-primary btn-block" BackColor="#5558C9" Text="Add Teacher" OnClick="btnAdd_Click"  />
            </div>
        </div>

        <div class="row mb-3 m-lg-5 ml-lg-5">
            <div class="col-md-12">
                <asp:GridView ID="GVToShowTeachers" runat="server" CssClass="table table-hover table-bordered" AllowPaging="True" AutoGenerateColumns="False" PageSize="6" EmptyDataText="No recordes to display..!" DataKeyNames="TeacherID" OnPageIndexChanging="GVToShowSubjects_PageIndexChanging" OnRowCancelingEdit="GVToShowSubjects_RowCancelingEdit"  OnRowEditing="GVToShowSubjects_RowEditing" OnRowUpdating="GVToShowSubjects_RowUpdating" OnRowDeleting="GVToShowTeachers_RowDeleting"  >
                    <Columns>
                        <asp:BoundField DataField="Sr.No" HeaderText="Sr.No" ReadOnly="True">
                        <ItemStyle HorizontalAlign="Center" VerticalAlign="Middle" />
                        </asp:BoundField>
                        <asp:TemplateField HeaderText="TeacherName">
                            <EditItemTemplate>
                                <asp:TextBox ID="txtTeacherName" runat="server" Text='<%# Eval("TeacherName") %>'  Width="100px" CssClass="form-control"></asp:TextBox>

                            </EditItemTemplate>
                            <ItemTemplate>
                                <asp:Label ID="lblTeacherName" runat="server" Text='<%# Eval("TeacherName") %>'></asp:Label>
                            </ItemTemplate>
                            <ItemStyle HorizontalAlign="Center" />
                        </asp:TemplateField>
                        <asp:TemplateField HeaderText="Teacher Phone Number">
                            <EditItemTemplate>
                                <asp:TextBox ID="txtTeacherPhoneNumber" runat="server" Text='<%# Eval("TeacherPhoneNumber") %>' Width="100px" CssClass="form-control"></asp:TextBox>
                            </EditItemTemplate>
                            <ItemTemplate>
                                <asp:Label ID="lblTeacherPhoneNumber" runat="server" Text='<%# Eval("TeacherPhoneNumber") %>'></asp:Label>
                            </ItemTemplate>
                            <ItemStyle HorizontalAlign="Center" VerticalAlign="Middle" />
                        </asp:TemplateField>



                        <asp:TemplateField HeaderText="Teacher Email">
                            
                            <ItemTemplate>
                                <asp:Label ID="lblTeacherEmail" runat="server" Text='<%# Eval("TeacherEmail") %>'></asp:Label>
                            </ItemTemplate>
                            <ItemStyle HorizontalAlign="Center" VerticalAlign="Middle" />
                        </asp:TemplateField>


                        <asp:TemplateField HeaderText="Teacher Password">
                            <EditItemTemplate>
                                <asp:TextBox ID="txtTeacherPassword" runat="server" Text='<%# Eval("TeacherPassword") %>' Width="100px" CssClass="form-control"></asp:TextBox>
                            </EditItemTemplate>
                            <ItemTemplate>
                                <asp:Label ID="lblTeacherPassword" runat="server" Text='<%# Eval("TeacherPassword") %>'></asp:Label>
                            </ItemTemplate>
                            <ItemStyle HorizontalAlign="Center" VerticalAlign="Middle" />
                        </asp:TemplateField>


                        <asp:TemplateField HeaderText="Teacher Address">
                            <EditItemTemplate>
                                <asp:TextBox ID="txtTeacherAddress" runat="server" Text='<%# Eval("TeacherAddress") %>' Width="100px" TextMode="MultiLine" CssClass="form-control"></asp:TextBox>
                            </EditItemTemplate>
                            <ItemTemplate>
                                <asp:Label ID="lblTeacherAddress" runat="server" Text='<%# Eval("TeacherAddress") %>'></asp:Label>
                            </ItemTemplate>
                            <ItemStyle HorizontalAlign="Center" VerticalAlign="Middle" />
                        </asp:TemplateField>


                        <asp:CommandField CausesValidation="false" HeaderText="Operation"  ShowEditButton="True" ShowDeleteButton="true">
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
