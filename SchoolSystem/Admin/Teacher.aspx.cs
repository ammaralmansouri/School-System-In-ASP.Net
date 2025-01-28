using SchoolSystem.Models;
using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Web.WebSockets;
using static SchoolSystem.Models.CommonFunction;

namespace SchoolSystem.Admin
{
    public partial class Teacher : System.Web.UI.Page
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
                GetAllTeachers();
            }
        }

        void GetAllTeachers()
        {
            DataTable DataTable1 = fn.SelectData("SELECT Row_NUMBER() over(order by (select 1)) as [Sr.No], TeacherID ,TeacherName , TeacherDateOfBirth , TeacherGender , TeacherPhoneNumber , TeacherPhoneNumber , TeacherEmail , TeacherAddress ,TeacherPassword from Teachers");
            GVToShowTeachers.DataSource = DataTable1;
            GVToShowTeachers.DataBind();
        }

        protected void btnAdd_Click(object sender, EventArgs e)
        {
            try
            {
                string Email = txtTeacherEmail.Text;
                DataTable DataTable1 = fn.SelectData("select * from Teachers where TeacherEmail = '" + Email + "'");

                if(DataTable1.Rows.Count ==0 )
                {
                    string QueryText = "insert into teachers values ('" + txtTeacherName.Text.Trim() + "','" + txtTeacherDateOFBirth.Text.Trim() + "','" +
                        DDLTeacherGender.SelectedValue + "','" + txtTeacherPhoneNumber.Text.Trim() + "','" + txtTeacherEmail.Text.Trim() + "','" +
                        txtTeacherAddress.Text.Trim() + "','" + txtTeachePassword.Text.Trim() + "')";

                    fn.ExecuteQuery(QueryText);

                    lblMessage.Text = "Teacher added successfuly";
                    lblMessage.CssClass = "alert alert-success";

                    txtTeachePassword.Text = string.Empty;
                    txtTeacherAddress.Text = string.Empty;
                    txtTeacherDateOFBirth.Text = string.Empty;
                    txtTeacherEmail.Text = string.Empty;    
                    txtTeacherName.Text = string.Empty;
                    txtTeacherPhoneNumber.Text = string.Empty;

                    GetAllTeachers();
                }
                else
                {
                    lblMessage.Text = "Enterd <b>'"+Email+"' already exsites..!";
                    lblMessage.CssClass = "alert alert-danger";
                }
            }
            catch(Exception ex)
            {
                Response.Write("<script>alert('" + ex.Message + "');</script>");

            }
        }

        protected void GVToShowSubjects_PageIndexChanging(object sender, GridViewPageEventArgs e)
        {
            GVToShowTeachers.PageIndex = e.NewPageIndex;
            GetAllTeachers();
        }

        protected void GVToShowSubjects_RowCancelingEdit(object sender, GridViewCancelEditEventArgs e)
        {
            GVToShowTeachers.EditIndex = -1;
        }

        protected void GVToShowTeachers_RowDeleting(object sender, GridViewDeleteEventArgs e)
        {
            try
            {
                int TeacherID = Convert.ToInt32(GVToShowTeachers.DataKeys[e.RowIndex].Values[0]);
                fn.ExecuteQuery("delete from teachers where teacherID = '"+TeacherID+"'");

                lblMessage.Text = "Teacher deleted successfuly";
                lblMessage.CssClass = "alert alert-success";

                GVToShowTeachers.EditIndex = -1;
                GetAllTeachers();
            }
            catch(Exception ex)
            {
                Response.Write("<script>alert('" + ex.Message + "');</script>");

            }
        }

        protected void GVToShowSubjects_RowEditing(object sender, GridViewEditEventArgs e)
        {
            GVToShowTeachers.EditIndex = e.NewEditIndex;
        }

        protected void GVToShowSubjects_RowUpdating(object sender, GridViewUpdateEventArgs e)
        {
            try
            {
                GridViewRow row = GVToShowTeachers.Rows[e.RowIndex];
                int TeacherID = Convert.ToInt32(GVToShowTeachers.DataKeys[e.RowIndex].Values[0]);
                
                string TeacherName = (row.FindControl("txtTeacherName") as TextBox).Text;
                string TeacherPhoneNumber = (row.FindControl("txtTeacherPhoneNumber") as TextBox).Text;
                string TeacherPassword = (row.FindControl("txtTeacherPassword") as TextBox).Text;
                string TeacherAddress = (row.FindControl("txtTeacherAddress") as TextBox).Text;

                fn.ExecuteQuery("update Teachers set TeacherName = '" + TeacherName.Trim() + "', TeacherPhoneNumber = '" + TeacherPhoneNumber.Trim() + "' , TeacherPassword = '"+ TeacherPassword.Trim() + "' , TeacherAddress =  '" + TeacherAddress.Trim() + "' where TeacherID = '" + TeacherID + "'");

                lblMessage.Text = "Teacher updated successfuly";
                lblMessage.CssClass = "alert alert-success";

                GVToShowTeachers.EditIndex = -1;
                GetAllTeachers();
            }
            catch (Exception ex)
            {
                Response.Write("<script>alert('" + ex.Message + "');</script>");

            }
        }
    }
}