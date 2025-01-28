using SchoolSystem.Models;
using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using static SchoolSystem.Models.CommonFunction;

namespace SchoolSystem.Admin
{
    public partial class ClassFees : System.Web.UI.Page
    {

        CommonFunctionx fn = new CommonFunctionx();
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["Admin"] == null)
            {
                Response.Redirect("../Login.aspx");
            }

            if (!IsPostBack)
            {
                GetClasses();
                GetFees();
            }
        }
        

        void GetClasses()
        {
            DataTable DataTable1 = fn.SelectData("select * from classes");
            DDLClasses.DataSource = DataTable1;
            DDLClasses.DataTextField = "ClassName";
            DDLClasses.DataValueField = "ClassID";
            DDLClasses.DataBind();
            DDLClasses.Items.Insert(0, "select classes");
        }

        protected void btnAdd_Click(object sender, EventArgs e)
        {
            try
            {
                string ClassVal = DDLClasses.SelectedItem.Text;
                DataTable DataTable1 = fn.SelectData("Select * from fees where ClassID='" + DDLClasses.SelectedItem.Value + "'");
                if (DataTable1.Rows.Count == 0)
                {
                    string QueryText = "insert into fees values ('"+ txtFeeAmounts.Text.Trim() + "','" + DDLClasses.SelectedItem.Value + "')";
                    fn.ExecuteQuery(QueryText);
                    lblMessage.Text = "Fee has been added successfuly";
                    lblMessage.CssClass = "alert alert-success";

                    DDLClasses.SelectedIndex = 0;
                    txtFeeAmounts.Text = string.Empty;
                    GetFees();
                }
                else
                {

                    lblMessage.Text = "Entereed fees already exists for <b>'"+ ClassVal + "'</b>";
                    lblMessage.CssClass = "alert alert-danger";
                }
            }
            catch (Exception ex)
            {
                Response.Write("<script>alert('" + ex.Message + "');</script>");
            }
        }

        void GetFees()
        {
            DataTable DataTable1 = fn.SelectData("Select Row_NUMBER() over(order by (select 1)) as [Sr.No] , f.feeID , f.ClassID , c.ClassName ,f.feeAmount from Fees f inner join classes c on c.ClassID = f.ClassID");
            GVToShowFees.DataSource = DataTable1;
            GVToShowFees.DataBind();
        }

        protected void GVToShowFees_PageIndexChanging(object sender, GridViewPageEventArgs e)
        {
            GVToShowFees.PageIndex = e.NewPageIndex;
            GetFees() ;
        }

        protected void GVToShowFees_RowCancelingEdit(object sender, GridViewCancelEditEventArgs e)
        {
            GVToShowFees.EditIndex = -1;
            GetFees();

        }

        protected void GVToShowFees_RowDeleting(object sender, GridViewDeleteEventArgs e)
        {
            try
            {
                int FeeID = Convert.ToInt32(GVToShowFees.DataKeys[e.RowIndex].Values[0]);

                fn.ExecuteQuery("delete from fees where FeeID = '" + FeeID + "'");

                lblMessage.Text = "Fee deleted successfuly";
                lblMessage.CssClass = "alert alert-success";

                GVToShowFees.EditIndex = -1;
                GetFees();
            }
            catch (Exception ex)
            {
                Response.Write("<script>alert('" + ex.Message + "');</script>");

            }
        }

        protected void GVToShowFees_RowEditing(object sender, GridViewEditEventArgs e)
        {
            GVToShowFees.EditIndex = e.NewEditIndex;
        }

        protected void GVToShowFees_RowUpdating(object sender, GridViewUpdateEventArgs e)
        {
            try
            {
                GridViewRow row = GVToShowFees.Rows[e.RowIndex];
                int FeeID = Convert.ToInt32(GVToShowFees.DataKeys[e.RowIndex].Values[0]);
                string FeeAmount = (row.FindControl("txtEditFeeAmount") as TextBox).Text;

                fn.ExecuteQuery("update fees set feeAmount = '" + FeeAmount.Trim() + "'where FeeID = '" + FeeID + "'");

                lblMessage.Text = "Fee updated successfuly";
                lblMessage.CssClass = "alert alert-success";

                GVToShowFees.EditIndex = -1;
                GetFees();
            }
            catch (Exception ex)
            {
                Response.Write("<script>alert('" + ex.Message + "');</script>");

            }
        }
    }
}