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
    public partial class Marks : System.Web.UI.Page
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
                GetAllMarks();
            }
        }

        void GetAllMarks()
        {
            DataTable DataTable1 = fn.SelectData("Select Row_NUMBER() over(order by (select 1)) as [Sr.No] , e.ExamID , " +
                " e.ClassID ,  c.ClassName , e.SubjectID , s.SubjectName , e.ExamRollNumber , e.ExamTotalMarks , e.ExamOutOfMarks from Exames e " +
                " inner join classes c on e.ClassID = c.ClassID inner join Subjects s on e.SubjectID = s.SubjectID");

            GVToShowMarks.DataSource = DataTable1;
            GVToShowMarks.DataBind();
        }

        void GetAllClasses()
        {
            DataTable DataTable1 = fn.SelectData("select * from classes");
            DDLClasses.DataSource = DataTable1;
            DDLClasses.DataTextField = "ClassName";
            DDLClasses.DataValueField = "ClassID";
            DDLClasses.DataBind();
            DDLClasses.Items.Insert(0, "select classes");
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


        protected void btnAdd_Click(object sender, EventArgs e)
        {
            try
            {
                string ClassID = DDLClasses.SelectedValue;
                string SubjectID = DDLSubjects.SelectedValue;
                string RollNumber = txtRollNumber.Text.Trim();
                string ExamTotalMarks = txtStudentTotalMarks.Text.Trim();
                string OutOfMarks = txtOutOfMarks.Text.Trim();

                DataTable DataTable1 = fn.SelectData("Select * from Students where StudentClassID='" + ClassID +
                                                     "' and StudentRollNumber = '" + RollNumber + "'");


                if (DataTable1.Rows.Count > 0)
                {
                    DataTable DataTable2 = fn.SelectData("Select * from Exames where ClassID='" + ClassID +
                                                    "' and subjectID = '" + SubjectID + "' and ExamRollNumber= '" + RollNumber + "'");

                    if (DataTable2.Rows.Count == 0)
                    {
                        string QueryText = "insert into Exames values ('" + RollNumber + "','" +
                        ExamTotalMarks + "','" + OutOfMarks + "','" + ClassID + "','" +
                        SubjectID + "')";
                        fn.ExecuteQuery(QueryText);

                        lblMessage.Text = "Successfuly inserted";
                        lblMessage.CssClass = "alert alert-success";

                        DDLClasses.SelectedIndex = 0;
                        DDLSubjects.SelectedIndex = 0;
                        txtRollNumber.Text = string.Empty;
                        txtStudentTotalMarks.Text = string.Empty;
                        txtOutOfMarks.Text = string.Empty;

                        GetAllMarks();
                    }
                    else
                    {

                        lblMessage.Text = "Entereed <b>Data</b> already exists ..!";
                        lblMessage.CssClass = "alert alert-danger";
                    }
                }
                else
                {

                    lblMessage.Text = "Entereed Roll Number <b>"+RollNumber+ "</b> dose not exists for selected class ..!";
                    lblMessage.CssClass = "alert alert-danger";
                }
            }
            catch (Exception ex)
            {
                Response.Write("<script>alert('" + ex.Message + "');</script>");
            }
        }

        protected void GVToShowMarks_PageIndexChanging(object sender, GridViewPageEventArgs e)
        {
            GVToShowMarks.PageIndex = e.NewPageIndex;
            GetAllMarks();
        }

        protected void GVToShowMarks_RowCancelingEdit(object sender, GridViewCancelEditEventArgs e)
        {
            GVToShowMarks.EditIndex = -1;
            GetAllMarks();
        }

        protected void GVToShowMarks_RowEditing(object sender, GridViewEditEventArgs e)
        {
            GVToShowMarks.EditIndex = e.NewEditIndex;
            GetAllMarks();
        }

        protected void GVToShowMarks_RowUpdating(object sender, GridViewUpdateEventArgs e)
        {
            try
            {
                GridViewRow row = GVToShowMarks.Rows[e.RowIndex];

                int ExamID = Convert.ToInt32(GVToShowMarks.DataKeys[e.RowIndex].Values[0]);
                string ClassID = ((DropDownList)GVToShowMarks.Rows[e.RowIndex].Cells[2].FindControl("DDLClassesGV")).SelectedValue;
                string SubjectID = ((DropDownList)GVToShowMarks.Rows[e.RowIndex].Cells[2].FindControl("DDLSubjectsGV")).SelectedValue;
                string RollNumber = (row.FindControl("txtRollNumberGV") as TextBox).Text.Trim();
                string StudentMarks = (row.FindControl("txtStudentMarksGV") as TextBox).Text.Trim();
                string OutOfMarks = (row.FindControl("txtOutOfMarksGV") as TextBox).Text.Trim();


                fn.ExecuteQuery("update Exames set ExamRollNumber = '" + RollNumber + "', ExamTotalMarks = '" + StudentMarks + "' , ExamOutOfMarks = '" + OutOfMarks + "' , ClassID = '" + ClassID + "' , SubjectID = '" + SubjectID + "' where ExamID = '" + ExamID + "'");

                lblMessage.Text = "Mark updated successfuly";
                lblMessage.CssClass = "alert alert-success";

                GVToShowMarks.EditIndex = -1;
                GetAllMarks();
            }
            catch (Exception ex)
            {
                Response.Write("<script>alert('" + ex.Message + "');</script>");

            }
        }

        protected void GVToShowMarks_RowDataBound(object sender, GridViewRowEventArgs e)
        {
            if (e.Row.RowType == DataControlRowType.DataRow)
            {
                if ((e.Row.RowState & DataControlRowState.Edit) > 0)
                {
                    DropDownList DDLClasses = (DropDownList)e.Row.FindControl("DDLClassesGV");
                    DropDownList DDLSubjects = (DropDownList)e.Row.FindControl("DDLSubjectsGV");

                    DataTable DataTable1 = fn.SelectData("select * from subjects where SubjectClassID = '" + DDLClasses.SelectedValue + "'");

                    DDLSubjects.DataSource = DataTable1;
                    DDLSubjects.DataTextField = "SubjectName";
                    DDLSubjects.DataValueField = "subjectID";

                    DDLSubjects.DataBind();

                    DDLSubjects.Items.Insert(0, "Select Subjects");


                    string SelectedSubject = DataBinder.Eval(e.Row.DataItem, "SubjectName").ToString();
                    DDLSubjects.Items.FindByText(SelectedSubject).Selected = true;

                }
            }
        }

        protected void DDLClassesGV_SelectedIndexChanged(object sender, EventArgs e)
        {
            DropDownList DDLClassesSelected = (DropDownList)sender;
            GridViewRow row = (GridViewRow)DDLClassesSelected.NamingContainer;

            if (row != null)
            {
                if ((row.RowState & DataControlRowState.Edit) > 0)
                {
                    DropDownList DDLSubjectsGV = (DropDownList)row.FindControl("DDLSubjectsGV");
                    DataTable DataTable1 = fn.SelectData("select * from subjects where subjectClassID = '" + DDLClassesSelected.SelectedValue + "'");

                    DDLSubjectsGV.DataSource = DataTable1;
                    DDLSubjectsGV.DataTextField = "SubjectName";
                    DDLSubjectsGV.DataValueField = "subjectID";

                    DDLSubjectsGV.DataBind();
                }
            }
        }

        
    }
}