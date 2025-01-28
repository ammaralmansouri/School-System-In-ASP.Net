using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using SchoolSystem.Models;
using static SchoolSystem.Models.CommonFunction;

namespace SchoolSystem.Admin
{
    public partial class Student : System.Web.UI.Page
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
                GetAllClasses();
                GetAllStudents();
            }

        }

        private void GetAllClasses()
        {
            DataTable DataTable1 = fn.SelectData("Select * from classes");
            DDLStudentClass.DataSource = DataTable1;

            DDLStudentClass.DataTextField = "ClassName";
            DDLStudentClass.DataValueField = "ClassID";

            DDLStudentClass.DataBind();

            DDLStudentClass.Items.Insert(0, "Select classes");
        }

        private void GetAllStudents()
        {
            DataTable DataTable1 = fn.SelectData("SELECT Row_NUMBER() over(order by (select 1)) as [Sr.No], StudentID ,StudentName , StudentDateOfBirth , StudentGender , StudentPhoneNumber  , StudentRollNumber , StudentAddress ,c.ClassID , c.ClassName from Students st inner join classes c on c.classID = st.StudentClassID");
            GVToShowStudents.DataSource = DataTable1;
            GVToShowStudents.DataBind();
        }

        protected void btnAdd_Click(object sender, EventArgs e)
        {
            try
            {
                string RollNumber = txtStudentRollNumber.Text;
                DataTable DataTable1 = fn.SelectData("select * from Students where StudentClassID = '"+DDLStudentClass.SelectedValue+"' and StudentRollNumber = '" + RollNumber + "'");

                if (DataTable1.Rows.Count == 0)
                {
                    string QueryText = "insert into Students values ('" + txtStudentName.Text.Trim() + "','" + txtStudentDateOFBirth.Text.Trim() + "','" +
                        DDLStudentGender.SelectedValue + "','" + txtStudentPhoneNumber.Text.Trim() + "','" + txtStudentRollNumber.Text.Trim() + "','" +
                        txtStudentAddress.Text.Trim() + "','" + DDLStudentClass.SelectedValue + "')";

                    fn.ExecuteQuery(QueryText);

                    lblMessage.Text = "Student added successfuly";
                    lblMessage.CssClass = "alert alert-success";

                    txtStudentRollNumber.Text = string.Empty;
                    txtStudentAddress.Text = string.Empty;
                    txtStudentDateOFBirth.Text = string.Empty;
                    DDLStudentClass.SelectedIndex = 0;
                    txtStudentName.Text = string.Empty;
                    txtStudentPhoneNumber.Text = string.Empty;

                    GetAllStudents();
                }
                else
                {
                    lblMessage.Text = "Enterd Rool Number. <b>'" + RollNumber + "' already exsites for selected class..!";
                    lblMessage.CssClass = "alert alert-danger";
                }
            }
            catch (Exception ex)
            {
                Response.Write("<script>alert('" + ex.Message + "');</script>");

            }
        }

        protected void GVToShowStudents_PageIndexChanging(object sender, GridViewPageEventArgs e)
        {
            GVToShowStudents.PageIndex = e.NewPageIndex;
            GetAllStudents();
        }

        protected void GVToShowStudents_RowUpdating(object sender, GridViewUpdateEventArgs e)
        {
            try
            {
                GridViewRow row = GVToShowStudents.Rows[e.RowIndex];
                int StudentID = Convert.ToInt32(GVToShowStudents.DataKeys[e.RowIndex].Values[0]);

                string StudentName = (row.FindControl("txtStudentName") as TextBox).Text;
                string StudentPhoneNumber = (row.FindControl("txtStudentPhoneNumber") as TextBox).Text;
                string StudentRollNumber = (row.FindControl("txtStudentRollNumber") as TextBox).Text;
                string StudentAddress = (row.FindControl("txtStudentAddress") as TextBox).Text;
                string StudentClassID = ((DropDownList)GVToShowStudents.Rows[e.RowIndex].Cells[4].FindControl("DDLClassName")).SelectedValue;

                fn.ExecuteQuery("update Students set StudentName = '" + StudentName.Trim() + "', StudentPhoneNumber = '" + StudentPhoneNumber.Trim() + "' , StudentRollNumber = '" + StudentRollNumber.Trim() + "' ,StudentAddress =  '" + StudentAddress.Trim() + "' , StudentClassID = '"+StudentClassID+"' where StudentID = '" + StudentID + "'");

                lblMessage.Text = "Student updated successfuly";
                lblMessage.CssClass = "alert alert-success";

                GVToShowStudents.EditIndex = -1;
                GetAllStudents();
            }
            catch (Exception ex)
            {
                Response.Write("<script>alert('" + ex.Message + "');</script>");

            }
        }

        protected void GVToShowStudents_RowEditing(object sender, GridViewEditEventArgs e)
        {
            GVToShowStudents.EditIndex = e.NewEditIndex;
            GetAllStudents();
        }

        protected void GVToShowStudents_RowCancelingEdit(object sender, GridViewCancelEditEventArgs e)
        {
            GVToShowStudents.EditIndex = -1;
            GetAllStudents();
        }

        protected void GVToShowStudents_RowDataBound(object sender, GridViewRowEventArgs e)
        {
            if (e.Row.RowType == DataControlRowType.DataRow && GVToShowStudents.EditIndex == e.Row.RowIndex)
            {
                
                DropDownList DDLClasses = (DropDownList)e.Row.FindControl("DDLClassName");

                DataTable DataTable1 = fn.SelectData("select * from Classes ");

                DDLClasses.DataSource = DataTable1;
                DDLClasses.DataTextField = "ClassName";
                DDLClasses.DataValueField = "ClassID";

                DDLClasses.DataBind();

                DDLClasses.Items.Insert(0, "Select classes");

                string SelectedClass = DataBinder.Eval(e.Row.DataItem, "ClassName").ToString();
                DDLClasses.Items.FindByText(SelectedClass).Selected = true;

                
            }
        }
    }
}