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
    public partial class AddClass : System.Web.UI.Page
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
                GetCalsses();

            }
        }

        void GetCalsses()
        {
            DataTable DataTable1 = fn.SelectData("Select Row_NUMBER() over(order by (select 1)) as [Sr.No] , ClassID , ClassName from Classes");
            GVToShowClasses.DataSource = DataTable1;
            GVToShowClasses.DataBind();
        }
        protected void btnAdd_Click(object sender, EventArgs e)
        {
            try
            {
                DataTable DataTable1 = fn.SelectData("Select * from Classes where ClassName='"+txtClassName.Text.Trim()+"'");
                if(DataTable1.Rows.Count == 0)
                {
                    string QueryText = "insert into classes values ('" + txtClassName.Text.Trim() + "')";
                    fn.ExecuteQuery(QueryText);
                    lblMessage.Text = "Class has been added successfuly";
                    lblMessage.CssClass = "alert alert-success";
                    txtClassName.Text = string.Empty;
                    GetCalsses();
                }
                else
                {

                    lblMessage.Text = "This class is already exists..!";
                    lblMessage.CssClass = "alert alert-danger";
                }
            }
            catch (Exception ex)
            {
                Response.Write("<script>alert('"+ex.Message+"');</script>");
            }
        }

        protected void GVToShowClasses_PageIndexChanging(object sender, GridViewPageEventArgs e)
        {
            GVToShowClasses.PageIndex = e.NewPageIndex;
            GetCalsses();
        }

        protected void GVToShowClasses_RowCancelingEdit(object sender, GridViewCancelEditEventArgs e)
        {
            GVToShowClasses.EditIndex = -1;
            GetCalsses();
        }

        protected void GVToShowClasses_RowEditing(object sender, GridViewEditEventArgs e)
        {
            GVToShowClasses.EditIndex = e.NewEditIndex;
        }

        protected void GVToShowClasses_RowUpdating(object sender, GridViewUpdateEventArgs e)
        {
            try
            {
                GridViewRow row = GVToShowClasses.Rows[e.RowIndex];
                int ClassID = Convert.ToInt32(GVToShowClasses.DataKeys[e.RowIndex].Values[0]);
                string ClassName = (row.FindControl("txtEditClassName") as TextBox).Text;

                fn.ExecuteQuery("update Classes set ClassName = '"+ClassName+"'where classID = '"+ClassID+"'");

                lblMessage.Text = "class updated successfuly";
                lblMessage.CssClass = "alert alert-success";

                GVToShowClasses.EditIndex = -1;
                GetCalsses();
            }
            catch(Exception ex)
            {
                Response.Write("<script>alert('" + ex.Message + "');</script>");

            }
        }
    }
}