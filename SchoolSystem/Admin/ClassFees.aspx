<%@ Page Title="" Language="C#" MasterPageFile="~/Admin/AdminMaster.Master" AutoEventWireup="true" CodeBehind="ClassFees.aspx.cs" Inherits="SchoolSystem.Admin.ClassFees" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">

        <div style="background-image:url(''); width:100%; height:720px; background-repeat:no-repeat; background-size:cover; background-attachment:fixed;">
   
    <div class="container p-md-4 p-sm-4">

        <div>
            <asp:Label ID="lblMessage" runat="server"  ></asp:Label>
        </div>
        <h3 class="text-center">New Fees</h3>

        <div class="row mb-3 m-lg-5 ml-lg-5 mt-md-5">

            <div class="col-md-6">
                <label for="txtClassName">Classes</label>
                <asp:DropDownList ID="DDLClasses" runat="server" CssClass="form-control"></asp:DropDownList>
                <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ErrorMessage="Class is required..!" 
                    ControlToValidate="DDLClasses" Display="Dynamic" ForeColor="Red" InitialValue="select classes" 
                    SetFocusOnError="True"></asp:RequiredFieldValidator>
            </div>


            <div class="col-md-6">
                <label for="txtFeeAmounts">Fees</label>
                <asp:TextBox ID="txtFeeAmounts" runat="server" CssClass="form-control" Placeholder="Enter fees Amount" TextMode="Number" required></asp:TextBox>
            </div>
        </div>


    
        <div class="row mb-3 m-lg-5 ml-lg-5">
            <div class="col-md-3 col-md-offset-2 mb-3">
                <asp:Button ID="btnAdd" runat="server" CssClass="btn btn-primary btn-block" BackColor="#5558C9" Text="Add" OnClick="btnAdd_Click"  />
            </div>
        </div>

        <div class="row mb-3 m-lg-5 ml-lg-5">
            <div class="col-md-8">
                <asp:GridView ID="GVToShowFees" runat="server" CssClass="table table-hover table-bordered" AllowPaging="True" AutoGenerateColumns="False" PageSize="7" EmptyDataText="No recordes to display..!" DataKeyNames="FeeID" OnPageIndexChanging="GVToShowFees_PageIndexChanging" OnRowCancelingEdit="GVToShowFees_RowCancelingEdit" OnRowDeleting="GVToShowFees_RowDeleting" OnRowEditing="GVToShowFees_RowEditing" OnRowUpdating="GVToShowFees_RowUpdating" >
                    <Columns>
                        <asp:BoundField DataField="Sr.No" HeaderText="Sr.No" ReadOnly="True">
                        <ItemStyle HorizontalAlign="Center" VerticalAlign="Middle" />
                        </asp:BoundField>
                        <asp:BoundField DataField="ClassName" HeaderText="Class" ReadOnly="True">
                        <ItemStyle HorizontalAlign="Center" VerticalAlign="Middle" />
                        </asp:BoundField>
                        <asp:TemplateField HeaderText="Fee Amount">
                            <EditItemTemplate>
                                <asp:TextBox ID="txtEditFeeAmount" runat="server" Text='<%# Eval("FeeAmount") %>' CssClass="form-control"></asp:TextBox>
                            </EditItemTemplate>
                            <ItemTemplate>
                                <asp:Label ID="Label1" runat="server" Text='<%# Eval("FeeAmount") %>'></asp:Label>
                            </ItemTemplate>
                            <ItemStyle HorizontalAlign="Center" VerticalAlign="Middle" />
                        </asp:TemplateField>
                        <asp:CommandField CausesValidation="false" HeaderText="Operation" ShowDeleteButton="True" ShowEditButton="True">
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
