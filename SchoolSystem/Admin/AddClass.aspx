<%@ Page Title="" Language="C#" MasterPageFile="~/Admin/AdminMaster.Master" AutoEventWireup="true" CodeBehind="AddClass.aspx.cs" Inherits="SchoolSystem.Admin.AddClass" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">

    <div style="background-image:url(''); width:100%; height:720px; background-repeat:no-repeat; background-size:cover; background-attachment:fixed;">
   
    <div class="container p-md-4 p-sm-4">

        <div>
            <asp:Label ID="lblMessage" runat="server"  ></asp:Label>
        </div>
        <h3 class="text-center">New Class</h3>

        <div class="row mb-3 m-lg-5 ml-lg-5 mt-md-5">
            <div class="col-md-6">
                <label for="txtClassName">Class Name</label>
                <asp:TextBox ID="txtClassName" runat="server" CssClass="form-control" Placeholder="Enter Class Name" required></asp:TextBox>
            </div>
        </div>


    
        <div class="row mb-3 m-lg-5 ml-lg-5">
            <div class="col-md-3 col-md-offset-2 mb-3">
                <asp:Button ID="btnAdd" runat="server" CssClass="btn btn-primary btn-block" BackColor="#5558C9" Text="Add Class" OnClick="btnAdd_Click" />
            </div>
        </div>

        <div class="row mb-3 m-lg-5 ml-lg-5">
            <div class="col-md-6">
                <asp:GridView ID="GVToShowClasses" runat="server" CssClass="table table-hover table-bordered" DataKeyNames="ClassID" EmptyDataText="No recorde to display..!" AllowPaging="True" AutoGenerateColumns="False" OnPageIndexChanging="GVToShowClasses_PageIndexChanging" OnRowCancelingEdit="GVToShowClasses_RowCancelingEdit" OnRowEditing="GVToShowClasses_RowEditing" OnRowUpdating="GVToShowClasses_RowUpdating" PageSize="7" >
                    <Columns>
                        <asp:BoundField DataField="Sr.No" HeaderText="Sr.No" ReadOnly="True">
                        <ItemStyle HorizontalAlign="Center" />
                        </asp:BoundField>
                        <asp:TemplateField HeaderText="Class">
                            <EditItemTemplate>
                                <asp:TextBox ID="txtEditClassName" runat="server" Text='<%# Eval("ClassName") %>' CssClass="form-control"></asp:TextBox>
                            </EditItemTemplate>
                            <ItemTemplate>
                                <asp:Label ID="lblClassName" runat="server" Text='<%# Eval("ClassName") %>'></asp:Label>
                            </ItemTemplate>
                            <ItemStyle HorizontalAlign="Center" />
                        </asp:TemplateField>
                        <asp:CommandField CausesValidation="False" HeaderText="Operations" ShowEditButton="True" />
                    </Columns>
                    <Headerstyle BackColor="#558C9" ForeColor="White" />
                </asp:GridView>

            </div>
        </div>

    </div>

</div>

</asp:Content>
