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
    public partial class Expense : System.Web.UI.Page
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
                GetAllExpense();
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

        void GetAllExpense()
        {
            DataTable DataTable1 = fn.SelectData("Select Row_NUMBER() over(order by (select 1)) as [Sr.No] , e.ExpenseID , " +
                "e.ClassID ,  c.ClassName , e.SubjectID , s.SubjectName , e.ExpenseChargeAmount from Expenses e " +
                "inner join classes c on e.ClassID = c.ClassID inner join Subjects s on e.SubjectID = s.SubjectID");

            GVToShowExpenses.DataSource = DataTable1;
            GVToShowExpenses.DataBind();
        }

        protected void btnAdd_Click(object sender, EventArgs e)
        {
            try
            {
                string ClassID = DDLClasses.SelectedValue;
                string SubjectID = DDLSubjects.SelectedValue;
                string ExpenseChargeAmount = txtExpenseAmount.Text.Trim();

                DataTable DataTable1 = fn.SelectData("Select * from expenses where ClassID='" + ClassID +
                                                     "' and subjectID = '" + SubjectID + "' or ExpenseChargeAmount= '" + ExpenseChargeAmount + "'");
                if (DataTable1.Rows.Count == 0)
                {
                    string QueryText = "insert into expenses values ('" + ExpenseChargeAmount + "','" + ClassID + "','" + SubjectID + "')";
                    fn.ExecuteQuery(QueryText);

                    lblMessage.Text = "Successfuly inserted";
                    lblMessage.CssClass = "alert alert-success";

                    DDLClasses.SelectedIndex = 0;
                    DDLSubjects.SelectedIndex = 0;
                    txtExpenseAmount.Text = string.Empty;

                    GetAllExpense();
                }
                else
                {

                    lblMessage.Text = "Entereed <b>Data</b> already exists ..!";
                    lblMessage.CssClass = "alert alert-danger";
                }
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

        protected void GVToShowSubjects_PageIndexChanging(object sender, GridViewPageEventArgs e)
        {
            GVToShowExpenses.PageIndex = e.NewPageIndex;
            GetAllExpense();
        }

        protected void GVToShowSubjects_RowCancelingEdit(object sender, GridViewCancelEditEventArgs e)
        {
            GVToShowExpenses.EditIndex = -1;
            GetAllExpense();
        }

        protected void GVToShowSubjects_RowDeleting(object sender, GridViewDeleteEventArgs e)
        {
            try
            {
                int ExpenseID = Convert.ToInt32(GVToShowExpenses.DataKeys[e.RowIndex].Values[0]);
                fn.ExecuteQuery("delete from Expenses where ExpenseID = '" + ExpenseID + "'");

                lblMessage.Text = "Expense deleted successfuly";
                lblMessage.CssClass = "alert alert-success";

                GVToShowExpenses.EditIndex = -1;
                GetAllExpense();
            }
            catch (Exception ex)
            {
                Response.Write("<script>alert('" + ex.Message + "');</script>");

            }
        }

        protected void GVToShowSubjects_RowEditing(object sender, GridViewEditEventArgs e)
        {
            GVToShowExpenses.EditIndex = e.NewEditIndex;
            GetAllExpense();
        }

        protected void GVToShowSubjects_RowUpdating(object sender, GridViewUpdateEventArgs e)
        {
            try
            {
                GridViewRow row = GVToShowExpenses.Rows[e.RowIndex];
                int ExpenseID = Convert.ToInt32(GVToShowExpenses.DataKeys[e.RowIndex].Values[0]);
                string ClassID = ((DropDownList)GVToShowExpenses.Rows[e.RowIndex].Cells[2].FindControl("DDLClassesGV")).SelectedValue;
                string SubjectID = ((DropDownList)GVToShowExpenses.Rows[e.RowIndex].Cells[2].FindControl("DDLSubjectsGV")).SelectedValue;
                string ExpenseChargeAmount = (row.FindControl("txtExpenseAmount") as TextBox).Text.Trim();


                fn.ExecuteQuery("update Expenses set ClassID = '" + ClassID + "', SubjectID = '" + SubjectID + "' , ExpenseChargeAmount = '" + ExpenseChargeAmount + "' where expenseid = '" + ExpenseID + "'");

                lblMessage.Text = "Expense updated successfuly";
                lblMessage.CssClass = "alert alert-success";

                GVToShowExpenses.EditIndex = -1;
                GetAllExpense();
            }
            catch (Exception ex)
            {
                Response.Write("<script>alert('" + ex.Message + "');</script>");

            }
        }

        protected void GVToShowTeacherSubjects_RowDataBound(object sender, GridViewRowEventArgs e)
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
    }
}