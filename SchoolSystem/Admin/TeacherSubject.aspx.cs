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
    public partial class TeacherSubject : System.Web.UI.Page
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
                GetAllTeachers();
                GetAllTeacherSubjects();
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

        private void GetAllTeachers()
        {
            DataTable DataTable1 = fn.SelectData("Select * from teachers");
            DDLTeachers.DataSource = DataTable1;

            DDLTeachers.DataTextField = "TeacherName";
            DDLTeachers.DataValueField = "TeacherID";

            DDLTeachers.DataBind();

            DDLTeachers.Items.Insert(0, "Select teachers");
        }


        void GetAllTeacherSubjects()
        {
            DataTable DataTable1 = fn.SelectData("Select Row_NUMBER() over(order by (select 1)) as [Sr.No] , " +
                "ts.teachersubjectID , ts.classID , c.className  , ts.subjectID , s.SubjectName , ts.teacherID , t.teacherName" +
                " from TeacherSubject ts inner join classes c on c.ClassID = ts.ClassID inner join subjects s on ts.subjectId = s.subjectID " +
                "inner join Teachers t on ts.TeacherID = t.teacherID");
            GVToShowTeacherSubjects.DataSource = DataTable1;
            GVToShowTeacherSubjects.DataBind();
        }
        protected void DDLClasses_SelectedIndexChanged(object sender, EventArgs e)
        {
            string ClassID = DDLClasses.SelectedValue;

            DataTable DataTable1 = fn.SelectData("Select * from subjects where subjectclassID = '"+ClassID+"'");
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
                string TeacherID = DDLTeachers.SelectedValue;
                DataTable DataTable1 = fn.SelectData("Select * from teachersubject where ClassID='" + ClassID + 
                                                     "' and subjectID = '" + SubjectID + "' or teacherID= '"+TeacherID+"'");
                if (DataTable1.Rows.Count == 0)
                {
                    string QueryText = "insert into TeacherSubject values ('" + ClassID + "','" +SubjectID + "','"+TeacherID+"')";
                    fn.ExecuteQuery(QueryText);
                    lblMessage.Text = "Successfuly inserted";
                    lblMessage.CssClass = "alert alert-success";

                    DDLClasses.SelectedIndex = 0;
                    DDLSubjects.SelectedIndex = 0;
                    DDLTeachers.SelectedIndex = 0;

                    GetAllTeacherSubjects();
                }
                else
                {

                    lblMessage.Text = "Entereed <b>Teacher subject</b> already exists ..!";
                    lblMessage.CssClass = "alert alert-danger";
                }
            }
            catch (Exception ex)
            {
                Response.Write("<script>alert('" + ex.Message + "');</script>");
            }
        }

        protected void GVToShowSubjects_PageIndexChanging(object sender, GridViewPageEventArgs e)
        {
            GVToShowTeacherSubjects.PageIndex = e.NewPageIndex;
            GetAllTeacherSubjects();
        }

        protected void GVToShowSubjects_RowCancelingEdit(object sender, GridViewCancelEditEventArgs e)
        {
            GVToShowTeacherSubjects.EditIndex = -1;
            GetAllTeacherSubjects();
        }

        protected void GVToShowSubjects_RowDeleting(object sender, GridViewDeleteEventArgs e)
        {
            try
            {
                int TeacherSubjectID = Convert.ToInt32(GVToShowTeacherSubjects.DataKeys[e.RowIndex].Values[0]);
                fn.ExecuteQuery("delete from teachersubject where teachersubjectid = '" + TeacherSubjectID + "'");

                lblMessage.Text = "Teacher subject delteted successfyly";
                lblMessage.CssClass = "alert alert-danger";

                GVToShowTeacherSubjects.EditIndex = -1;
                GetAllTeacherSubjects();   

            }
            catch(Exception ex)
            {
                Response.Write("<script>alert('" + ex.Message + "');</script>");

            }
        }

        protected void GVToShowSubjects_RowEditing(object sender, GridViewEditEventArgs e)
        {
            GVToShowTeacherSubjects.EditIndex = e.NewEditIndex;
            GetAllTeacherSubjects() ;
        }

        protected void GVToShowSubjects_RowUpdating(object sender, GridViewUpdateEventArgs e)
        {
            try
            {
                GridViewRow row = GVToShowTeacherSubjects.Rows[e.RowIndex];
                int TeacherSubjectID = Convert.ToInt32(GVToShowTeacherSubjects.DataKeys[e.RowIndex].Values[0]);
                string ClassID = ((DropDownList)GVToShowTeacherSubjects.Rows[e.RowIndex].Cells[2].FindControl("DDLClassesGV")).SelectedValue;
                string SubjectID = ((DropDownList)GVToShowTeacherSubjects.Rows[e.RowIndex].Cells[2].FindControl("DDLSubjectsGV")).SelectedValue;
                string TeacherID = ((DropDownList)GVToShowTeacherSubjects.Rows[e.RowIndex].Cells[2].FindControl("DDLTeacherGV")).SelectedValue;


                fn.ExecuteQuery("update teachersubject set ClassID = '" + ClassID + "', SubjectID = '" + SubjectID + "' , teacherID = '"+ TeacherID+"' where TeacherSubjectID = '" + TeacherSubjectID + "'");

                lblMessage.Text = "Teacher Subjetct updated successfuly";
                lblMessage.CssClass = "alert alert-success";

                GVToShowTeacherSubjects.EditIndex = -1;
                GetAllTeacherSubjects();
            }
            catch (Exception ex)
            {
                Response.Write("<script>alert('" + ex.Message + "');</script>");

            }
        }

        protected void DDLClassesGV_SelectedIndexChanged(object sender, EventArgs e)
        {
            DropDownList DDLClassesSelected = (DropDownList)sender;
            GridViewRow row = (GridViewRow)DDLClassesSelected.NamingContainer;

            if(row != null )
            {
                if((row.RowState & DataControlRowState.Edit) > 0)
                {
                    DropDownList DDLSubjectsGV = (DropDownList)row.FindControl("DDLSubjectsGV");
                    DataTable DataTable1 = fn.SelectData("select * from subjects where subjectClassID = '"+DDLClassesSelected.SelectedValue+"'");

                    DDLSubjectsGV.DataSource = DataTable1;
                    DDLSubjectsGV.DataTextField = "SubjectName";
                    DDLSubjectsGV.DataValueField = "subjectID";

                    DDLSubjectsGV.DataBind();
                }
            }
        }

        protected void GVToShowTeacherSubjects_RowDataBound(object sender, GridViewRowEventArgs e)
        {
            if(e.Row.RowType == DataControlRowType.DataRow)
            {
                if((e.Row.RowState & DataControlRowState.Edit) > 0)
                {
                    DropDownList DDLClasses = (DropDownList)e.Row.FindControl("DDLClassesGV");
                    DropDownList DDLSubjects = (DropDownList)e.Row.FindControl("DDLSubjectsGV");

                    DataTable DataTable1 = fn.SelectData("select * from subjects where subjectClassID = '" + DDLClasses.SelectedValue + "'");

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
    }
}