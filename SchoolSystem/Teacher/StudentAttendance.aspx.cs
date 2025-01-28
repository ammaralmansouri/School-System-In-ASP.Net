using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using static SchoolSystem.Models.CommonFunction;

namespace SchoolSystem.Teacher
{
    public partial class StudentAttendance : System.Web.UI.Page
    {

        CommonFunctionx fn = new CommonFunctionx();

        protected void Page_Load(object sender, EventArgs e)
        {

            if (Session["Teacher"] == null)
            {
                Response.Redirect("../Login.aspx");
            }

            if (!IsPostBack)
            {
                GetAllClasses();
                btnMarkAttendance.Visible = false;  
            }

        }


        private void GetAllClasses()
        {
            DataTable DataTable1 = fn.SelectData("Select * from Classes");
            DDLClasses.DataSource = DataTable1;

            DDLClasses.DataTextField = "ClassName";
            DDLClasses.DataValueField = "ClassID";

            DDLClasses.DataBind();

            DDLClasses.Items.Insert(0, "Select classes");
        }

        protected void DDLClasses_SelectedIndexChanged(object sender, EventArgs e)
        {
            string ClassID = DDLClasses.SelectedValue;

            DataTable DataTable1 = fn.SelectData("Select * from subjects where subjectclassID = '" + ClassID + "'");
            DDLSubjects.DataSource = DataTable1;

            DDLSubjects.DataTextField = "SubjectName";
            DDLSubjects.DataValueField = "subjectID";

            DDLSubjects.DataBind();

            DDLSubjects.Items.Insert(0, "Select Subjects");
        }

        
        protected void Timer1_Tick(object sender, EventArgs e)
        {
            lblTime.Text = DateTime.Now.ToString();
        }

        protected void btnSubmit_Click(object sender, EventArgs e)
        {
            DataTable DataTable1 = fn.SelectData("Select StudentID , StudentRollNumber , StudentName , StudentPhoneNumber " +
                                                  " from Students where studentClassID = '"+DDLClasses.SelectedValue+"'");

            GVToShowAttendance.DataSource = DataTable1;
            GVToShowAttendance.DataBind();

            if(DataTable1.Rows.Count > 0)
            {
                btnMarkAttendance.Visible = true;
                GVToShowAttendance.Visible = true;
            }
            else
            {
                btnMarkAttendance.Visible = false;
                GVToShowAttendance.Visible = true;

            }
        }

        void VisibleEqualFalseForbtnMarkAttendanceAndGVToShowAttendance()
        {
            btnMarkAttendance.Visible = false;
            GVToShowAttendance.Visible = false;
        }


        protected void btnMarkAttendance_Click(object sender, EventArgs e)
        {
            DataTable DataTable1 = fn.SelectData("select * from StydentsAttendance where StudentAttendanceDate = '" + DateTime.Now.ToString() + "' and subjectID = '"+DDLSubjects.SelectedValue+"'");

            if (DataTable1.Rows.Count > 0)
            {
                lblMessage.Text = "Student has been Attended for this subject today..!";
                lblMessage.CssClass = "alert alert-danger";

                VisibleEqualFalseForbtnMarkAttendanceAndGVToShowAttendance();

            }
            else
            {
                int Statues = 0;
                bool IsDoneInserted = false;

                foreach (GridViewRow row in GVToShowAttendance.Rows)
                {
                    string StudentRollNumber = row.Cells[2].Text.Trim();

                    RadioButton rb1 = (row.Cells[0].FindControl("RadioButton1") as RadioButton);
                    RadioButton rb2 = (row.Cells[0].FindControl("RadioButton2") as RadioButton);

                    if (rb1.Checked)
                    {
                        Statues = 1;
                    }
                    else if (rb2.Checked)
                    {
                        Statues = 0;
                    }

                    fn.ExecuteQuery("insert into StydentsAttendance values('" + Statues + "' , '" + DateTime.Now.ToString("yyyy/MM/dd") +
                        "','" + StudentRollNumber + "','" + DDLSubjects.SelectedValue + "','" + DDLClasses.SelectedValue + "')");
                    IsDoneInserted = true;

                }
                if (IsDoneInserted)
                {
                    lblMessage.Text = "Inserted done successfuly";
                    lblMessage.CssClass = "alert alert-success";

                    VisibleEqualFalseForbtnMarkAttendanceAndGVToShowAttendance();
                }
                else
                {
                    lblMessage.Text = "Somthing went wrong..!";
                    lblMessage.CssClass = "alert alert-warning";

                    VisibleEqualFalseForbtnMarkAttendanceAndGVToShowAttendance();
                }


            }

        }
    }
}