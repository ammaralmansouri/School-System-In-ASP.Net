<%@ Page Title="" Language="C#" MasterPageFile="~/Admin/AdminMaster.Master" AutoEventWireup="true" CodeBehind="Expense.aspx.cs" Inherits="SchoolSystem.Admin.Expense" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">


    <div style="background-image:url(''); width:100%; height:720px; background-repeat:no-repeat; background-size:cover; background-attachment:fixed;">
   
        <div class="container p-md-4 p-sm-4">

            <div>
                <asp:Label ID="lblMessage" runat="server"  ></asp:Label>
            </div>
            <h3 class="text-center">Add Expense</h3>

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
                     <label for="txtExpenseAmount">Charge Amount</label>
                     <asp:TextBox ID="txtExpenseAmount" runat="server" CssClass="form-control" placeHolder="Enter Charge Amount" TextMode="Number" required></asp:TextBox>
     
                 </div>
             </div>

            <div class="row mb-3 m-lg-5 ml-lg-5">
                <div class="col-md-3 col-md-offset-2 mb-3">
                    <asp:Button ID="btnAdd" runat="server" CssClass="btn btn-primary btn-block" BackColor="#5558C9" Text="Add Expense" OnClick="btnAdd_Click" />
                </div>
            </div>

            <div class="row mb-3 m-lg-5 ml-lg-5">
                <div class="col-md-8">
                    <asp:GridView ID="GVToShowExpenses" runat="server" CssClass="table table-hover table-bordered" AllowPaging="True" AutoGenerateColumns="False" PageSize="6" EmptyDataText="No recordes to display..!" DataKeyNames="ExpenseID" OnPageIndexChanging="GVToShowSubjects_PageIndexChanging" OnRowCancelingEdit="GVToShowSubjects_RowCancelingEdit"  OnRowEditing="GVToShowSubjects_RowEditing" OnRowUpdating="GVToShowSubjects_RowUpdating" OnRowDeleting="GVToShowSubjects_RowDeleting" OnRowDataBound="GVToShowTeacherSubjects_RowDataBound"  >
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


                        <asp:TemplateField HeaderText="Charge Amount">
                            <EditItemTemplate>
                                <asp:TextBox ID="txtExpenseAmount" runat="server" CssClass="form-control" TextMode="Number" Text='<%# Eval("ExpenseChargeAmount") %>'></asp:TextBox>
                            </EditItemTemplate>
                            <ItemTemplate>
                                <asp:Label ID="Label2" runat="server" Text='<%# Eval("ExpenseChargeAmount") %>'></asp:Label>
                            </ItemTemplate>
                            <ItemStyle HorizontalAlign="Center" />
                        </asp:TemplateField>
                        <asp:CommandField CausesValidation="false" HeaderText="Operation"  ShowEditButton="True" ShowDeleteButton="true">
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
