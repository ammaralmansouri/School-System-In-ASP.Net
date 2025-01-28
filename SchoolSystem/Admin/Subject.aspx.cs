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
    public partial class Subject : System.Web.UI.Page
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
                GetSubjects();
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
                DataTable DataTable1 = fn.SelectData("Select * from subjects where SubjectClassID='" + DDLClasses.SelectedItem.Value + "'and subjectName = '"+txtSubjectName.Text.Trim()+"'");
                if (DataTable1.Rows.Count == 0)
                {
                    string QueryText = "insert into Subjects values ('" + txtSubjectName.Text.Trim() + "','" + DDLClasses.SelectedItem.Value + "')";
                    fn.ExecuteQuery(QueryText);
                    lblMessage.Text = "Subject has been added successfuly";
                    lblMessage.CssClass = "alert alert-success";

                    DDLClasses.SelectedIndex = 0;
                    txtSubjectName.Text = string.Empty;
                    GetSubjects();
                }
                else
                {

                    lblMessage.Text = "Entereed subject already exists for <b>'" + ClassVal + "'</b>";
                    lblMessage.CssClass = "alert alert-danger";
                }
            }
            catch (Exception ex)
            {
                Response.Write("<script>alert('" + ex.Message + "');</script>");
            }
        }

        void GetSubjects()
        {
            DataTable DataTable1 = fn.SelectData("Select Row_NUMBER() over(order by (select 1)) as [Sr.No] ," +
                " s.subjectID ,  s.subjectClassID , c.ClassName ,s.subjectName " +
                "from Subjects s inner join classes c on c.ClassID = s.SubjectClassID");
            GVToShowSubjects.DataSource = DataTable1;
            GVToShowSubjects.DataBind();
        }

        protected void GVToShowSubjects_PageIndexChanging(object sender, GridViewPageEventArgs e)
        {
            GVToShowSubjects.PageIndex = e.NewPageIndex;
            GetSubjects();
        }

        protected void GVToShowSubjects_RowCancelingEdit(object sender, GridViewCancelEditEventArgs e)
        {
            GVToShowSubjects.EditIndex = -1;
            GetSubjects();

        }

        

        protected void GVToShowSubjects_RowEditing(object sender, GridViewEditEventArgs e)
        {
            GVToShowSubjects.EditIndex = e.NewEditIndex;
            //GetSubjects();
        }

        protected void GVToShowSubjects_RowUpdating(object sender, GridViewUpdateEventArgs e)
        {
            try
            {
                GridViewRow row = GVToShowSubjects.Rows[e.RowIndex];
                int SubjectID = Convert.ToInt32(GVToShowSubjects.DataKeys[e.RowIndex].Values[0]);
                string ClassID = ((DropDownList)GVToShowSubjects.Rows[e.RowIndex].Cells[2].FindControl("DropDownList1")).SelectedValue;
                string SubjectName = (row.FindControl("txtEditSubjectName") as TextBox).Text;

                fn.ExecuteQuery("update subjects set SubjectClassID = '" + ClassID + "', SubjectName = '"+SubjectName+"'where SubjectID = '" + SubjectID + "'");

                lblMessage.Text = "Subjetct updated successfuly";
                lblMessage.CssClass = "alert alert-success";

                GVToShowSubjects.EditIndex = -1;
                GetSubjects();
            }
            catch (Exception ex)
            {
                Response.Write("<script>alert('" + ex.Message + "');</script>");

            }
        }
    }
}