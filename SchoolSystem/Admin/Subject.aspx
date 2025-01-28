<%@ Page Title="" Language="C#" MasterPageFile="~/Admin/AdminMaster.Master" AutoEventWireup="true" CodeBehind="Subject.aspx.cs" Inherits="SchoolSystem.Admin.Subject" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">

            <div style="background-image:url(''); width:100%; height:720px; background-repeat:no-repeat; background-size:cover; background-attachment:fixed;">
   
    <div class="container p-md-4 p-sm-4">

        <div>
            <asp:Label ID="lblMessage" runat="server"  ></asp:Label>
        </div>
        <h3 class="text-center">New Subject</h3>

        <div class="row mb-3 m-lg-5 ml-lg-5 mt-md-5">

            <div class="col-md-6">
                <label for="txtClassName">Classes</label>
                <asp:DropDownList ID="DDLClasses" runat="server" CssClass="form-control"></asp:DropDownList>
                <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ErrorMessage="Class is required..!" 
                    ControlToValidate="DDLClasses" Display="Dynamic" ForeColor="Red" InitialValue="select classes" 
                    SetFocusOnError="True"></asp:RequiredFieldValidator>
            </div>


            <div class="col-md-6">
                <label for="txtSubjectName">Subject Name</label>
                <asp:TextBox ID="txtSubjectName" runat="server" CssClass="form-control" Placeholder="Enter Subject Name"  required></asp:TextBox>
            </div>
        </div>


    
        <div class="row mb-3 m-lg-5 ml-lg-5">
            <div class="col-md-3 col-md-offset-2 mb-3">
                <asp:Button ID="btnAdd" runat="server" CssClass="btn btn-primary btn-block" BackColor="#5558C9" Text="Add Subject" OnClick="btnAdd_Click"  />
            </div>
        </div>

        <div class="row mb-3 m-lg-5 ml-lg-5">
            <div class="col-md-8">
                <asp:GridView ID="GVToShowSubjects" runat="server" CssClass="table table-hover table-bordered" AllowPaging="True" AutoGenerateColumns="False" PageSize="18" EmptyDataText="No recordes to display..!" DataKeyNames="SubjectID" OnPageIndexChanging="GVToShowSubjects_PageIndexChanging" OnRowCancelingEdit="GVToShowSubjects_RowCancelingEdit"  OnRowEditing="GVToShowSubjects_RowEditing" OnRowUpdating="GVToShowSubjects_RowUpdating"  >
                    <Columns>
                        <asp:BoundField DataField="Sr.No" HeaderText="Sr.No" ReadOnly="True">
                        <ItemStyle HorizontalAlign="Center" VerticalAlign="Middle" />
                        </asp:BoundField>
                        <asp:TemplateField HeaderText="Class">
                            <EditItemTemplate>
                                <asp:DropDownList ID="DropDownList1" runat="server" DataSourceID="SqlDataSource1" DataTextField="ClassName" DataValueField="ClassID" SelectedValue='<%# Eval("ClassID") %>' CssClass="form-control">
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
                                <asp:TextBox ID="txtEditSubjectName" runat="server" Text='<%# Eval("SubjectName") %>' CssClass="form-control"></asp:TextBox>
                            </EditItemTemplate>
                            <ItemTemplate>
                                <asp:Label ID="Label1" runat="server" Text='<%# Eval("SubjectName") %>'></asp:Label>
                            </ItemTemplate>
                            <ItemStyle HorizontalAlign="Center" VerticalAlign="Middle" />
                        </asp:TemplateField>
                        <asp:CommandField CausesValidation="false" HeaderText="Operation"  ShowEditButton="True">
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
