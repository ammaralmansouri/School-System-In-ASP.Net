<%@ Page Title="" Language="C#" MasterPageFile="~/Admin/AdminMaster.Master" AutoEventWireup="true" CodeBehind="ExpenseDetails.aspx.cs" Inherits="SchoolSystem.Admin.ExpenseDetails" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">

    <script type="text/javascript" src="https://ajax.googleapis.com/ajax/libs/jquery/1.8.3/jquery.min.js"></script>
    <script type="text/javascript" src="https://cdn.datatables.net/1.10.20/js/jquery.dataTables.min.js"></script>
    <link href="https://cdn.datatables.net/1.10.20/css/jquery.dataTables.css" rel="stylesheet" type="text/css" />

    <script type="text/javascript">
        $(document).ready(function () {
            $('#<%=GVToShowExpenseDetails.ClientID%>').prepend($("<thead></thead>").prepend($(this).find("tr:first"))).DataTable({ "paging": true, "ordering": true, "searching": true });
        });

    </script>


</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">


    <div style="background-image:url(''); width:100%; height:720px; background-repeat:no-repeat; background-size:cover; background-attachment:fixed;">
   
    <div class="container p-md-4 p-sm-4">

        
        <h3 class="text-center">Expense Details</h3>

        

        <div class="row mb-3 m-lg-5 ml-lg-5">
            <div class="col-md-12">
                <asp:GridView ID="GVToShowExpenseDetails" runat="server" CssClass="table table-hover table-bordered"  AutoGenerateColumns="False"  EmptyDataText="No recordes to display..!">
                <Columns>

                    <asp:BoundField DataField="Sr.No" HeaderText="Sr.No" >
                    <ItemStyle HorizontalAlign="Center" VerticalAlign="Middle" />
                    </asp:BoundField>

                    <asp:BoundField DataField="ClassName" HeaderText="Class" >
                    <ItemStyle HorizontalAlign="Center" VerticalAlign="Middle" />
                    </asp:BoundField>

                    <asp:BoundField DataField="SubjectName" HeaderText="Subject" >
                    <ItemStyle HorizontalAlign="Center" VerticalAlign="Middle" />
                    </asp:BoundField>

                    <asp:BoundField DataField="ExpenseChargeAmount" HeaderText="Charge Amount" >
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
