using BVM.BLL;
using BVM.Models;
using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Net.Mail;
using System.Text;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class _Default : System.Web.UI.Page
{
    ClassModel clsMod = new ClassModel();

    static string fullText = "abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ123456789";
    StringBuilder newCaptcha = new StringBuilder();

    static int RegistrationId = 0;

    protected void Page_Load(object sender, EventArgs e)
    {
        if (!Page.IsPostBack)
        {
            FirstControl();

            lblIPAddress.Text = "Your IP is : " + GetIP().ToString();

            Random rnd = new Random();
            int length = 5;
            while (0 < length--)
            {
                newCaptcha.Append(fullText[rnd.Next(fullText.Length)]);
            }

            lblCaptcha.Text = newCaptcha.ToString().ToUpper();
        }
    }

    public string GetIP()
    {
        string ipaddress;
        ipaddress = Request.ServerVariables["HTTP_X_FORWARDED_FOR"];
        if (ipaddress == "" || ipaddress == null)
            ipaddress = Request.ServerVariables["REMOTE_ADDR"];
        return ipaddress;

    }

    private void NewRegistration()
    {
        ParentsDetails parents = new ParentsDetails();
        ParentsDetailsBLL parentBL = new ParentsDetailsBLL();
        IP_address IpAdrs = new IP_address();

        IpAdrs.IP_Address = GetIP().ToString();
        clsMod = GetClassList();

        parents.FatherName = txtFatherName.Text;
        parents.MotherName = txtMotherName.Text;
        parents.Email_Father = txtFatherEmail.Text;
        parents.Email_Mother = txtMotherEmail.Text;
        parents.Mobile_Father = txtFatherMobile.Text;
        parents.Mobile_Mother = txtMotherMobile.Text;

        //int exists = parentBL.ParentsDetailsExists(parents);

        //if (exists > 0)
        //{
        //    Page.ClientScript.RegisterStartupScript(this.GetType(), "Alert", "<script>alert('Sorry, the Mobile numbers & Email IDs entered has already been used for registration.Please submit the form with new details. ');</script>");

        //}
        //else
        //{
            int res = parentBL.Create(parents, clsMod, IpAdrs);
            RegistrationId = res;

            if (res > 0)
            {
                SendMailToParents();
                SendMailToAdmin();
                ClearAllFields(this);
                Response.Redirect("seminarregistrationsuccess.aspx");

            }
            else
            {
                Page.ClientScript.RegisterStartupScript(this.GetType(), "Alert", "<script>alert('Sorry!!!, there was an unexpected error, please try again.');</script>");
            }
        //}

    }

    private ClassModel GetClassList()
    {
        foreach (GridViewRow gridrow in grid.Rows)
        {
            if (gridrow.RowType == DataControlRowType.DataRow)
            {
                string cls = ((DropDownList)gridrow.FindControl("ddlClass")).SelectedValue;
                clsMod.ClassList.Add(cls);
            }
        }
        return clsMod;
    }

    private void SendMailToParents()
    {
        SmtpClient mail = new SmtpClient();
        MailMessage message = new MailMessage();

        message.From = new MailAddress("Seminar Registration@bvminternational.org<inputsfrom@sitequery.info>");

        message.To.Add(txtFatherEmail.Text);
        message.To.Add(txtMotherEmail.Text);

        if (!String.IsNullOrEmpty(ConfigurationManager.AppSettings["SeminarMailBCC"]))
        {
            message.Bcc.Add(ConfigurationManager.AppSettings["SeminarMailBCC"]);
        }


        message.Subject = "BVM I Seminar Registration | Your Invite #" + RegistrationId.ToString();
        message.IsBodyHtml = true;

        StringBuilder str = new StringBuilder();

        str.Append("<div style='width: 100%; max-width: 600px; text-align: center;'>");
        str.Append("<div>");
        str.Append("<img alt='logo' src='http://bvmi.webpriti.com/images/admin/bvmilogo.png' style='width: 200px' /><br />");
        str.Append("<br />");
        str.Append("</div>");
        str.Append("<div style='text-align: center; font-weight: bold; font-family: Verdana; font-size: 20px;'>");
        str.Append("BVM International<br />");
        str.Append("<br />");
        str.Append("</div>");
        str.Append("<div style='text-align: center; font-weight: bold; font-family: Verdana; font-size: 17px;'>");
        str.Append("Cordially invites you to a “Free” seminar<br />");
        str.Append("<br />");
        str.Append("</div>");
        str.Append("<div style='text-align: center; font-weight: bold; font-family: Verdana; font-size: 22px;'>");
        str.Append("Through the Looking Glass – Future of Learning<br />");
        str.Append("<br />");
        str.Append("</div>");
        str.Append("<div style='text-align: left; font-weight: normal; font-family: Verdana; font-size: 13px;'>");
        str.Append("Date : Sunday, 21st February 2016   | Time : 10 am to 11:15 am<br />");
        str.Append("Venue : New Club House, Bollineni Hillside campus,  Sholinganallur OMR Chennai<br />");
        str.Append("<br />"); str.Append("<br /><br/>");
        str.Append("Note : Kindly carry e-invitation with you | Your Invite # " + RegistrationId.ToString());
        str.Append("<br />"); str.Append("<br />");
        str.Append("Thank you<br />");
        str.Append("Team BVM International");
        str.Append("</div>");
        str.Append("</div>");

        message.Body = str.ToString();

        mail.Send(message);
    }

    private void SendMailToAdmin()
    {
        SmtpClient mail = new SmtpClient();
        MailMessage message = new MailMessage();

        message.From = new MailAddress("Seminar Registration@bvminternational.org<inputsfrom@sitequery.info>");

        message.To.Add("info@bvminternational.org");

        if (!String.IsNullOrEmpty(ConfigurationManager.AppSettings["SeminarMailBCC"]))
        {
            message.Bcc.Add(ConfigurationManager.AppSettings["SeminarMailBCC"]);
        }


        message.Subject = "BVM I Seminar Registration Details";
        message.IsBodyHtml = true;

        StringBuilder str = new StringBuilder();

        str.Append("<div style='width: 100%; max-width: 600px; text-align: center;'>");

        str.Append("<br/><br/>");
        str.Append("You have 1 Seminar Registration, please find details below");
        str.Append("<br/><br/>");

        str.Append("<table>");


        int count = 1;
        foreach (GridViewRow gridrow in grid.Rows)
        {
            if (gridrow.RowType == DataControlRowType.DataRow)
            {
                DropDownList ddlClass = (DropDownList)gridrow.FindControl("ddlClass");
                str.Append("<tr>");
                str.Append("<td>Child Class " + count + "</td><td>:</td><td>" + ddlClass.SelectedValue + "</td>");
                str.Append("</tr>");
                count++;
            }
        }

        str.Append("<tr>");
        str.Append("<td>Father Name</td><td>:</td><td> " + txtFatherName.Text + "</td>");
        str.Append("</tr>");

        str.Append("<tr>");
        str.Append("<td>Father Email</td><td>:</td><td> " + txtFatherEmail.Text + "</td>");
        str.Append("</tr>");

        str.Append("<tr>");
        str.Append("<td>Father Mobile</td><td>:</td><td> " + txtFatherMobile.Text + "</td>");
        str.Append("</tr>");


        str.Append("<tr>");
        str.Append("<td>Mother Name</td><td>:</td><td> " + txtMotherName.Text + "</td>");
        str.Append("</tr>");

        str.Append("<tr>");
        str.Append("<td>Mother Mobile</td><td>:</td><td> " + txtMotherMobile.Text + "</td>");
        str.Append("</tr>");

        str.Append("<tr>");
        str.Append("<td>Mother Email</td><td>:</td><td> " + txtMotherEmail.Text + "</td>");
        str.Append("</tr>");


        str.Append("</table>");
        str.Append("</div>");

        message.Body = str.ToString();

        mail.Send(message);
    }

    static string[] listClasses = new string[] { "Select Class", "pre primary1 (Pre KG)", "Pre primary2 (LKG)", "Pre primary3 (UKG)", "Primary1 (class 1)", "Primary2 (class 2)", "Primary3 (class 3)", "Primary4 (class 4)", " Primary5 (class 5)", "Lower Secondary6 (class 6)", "Lower Secondary7 (class 7)" };

    public void FirstControl()
    {
        DataTable dt = new DataTable();
        DataRow dr = null;

        dt.Columns.Add(new DataColumn("ddlClass", typeof(string)));

        dr = dt.NewRow();
        dr["ddlClass"] = string.Empty;
        dt.Rows.Add(dr);
        ViewState["CurrentControlsList"] = dt;

        grid.DataSource = dt;
        grid.DataBind();
    }

    //protected void btnSubmit_Click(object sender, EventArgs e)
    //{

    //    if (!txtCaptcha.Text.ToLower().Equals(lblCaptcha.Text.ToLower()))
    //    {

    //        lblCaptchaError.Visible = true;

    //    }
    //    else
    //    {
    //        lblCaptchaError.Visible = false;
    //        NewRegistration();
    //    }

    //}

    protected void btnSubmit_Click(object sender, EventArgs e)
    {
        if (!txtCaptcha.Text.ToLower().Equals(lblCaptcha.Text.ToLower()))
        {
            lblCaptchaError.Visible = true;
        }
        else
        {
            lblCaptchaError.Visible = false;

            ParentsDetails parents = new ParentsDetails();
            ParentsDetailsBLL parentBL = new ParentsDetailsBLL();

            parents.FatherName = txtFatherName.Text;
            parents.MotherName = txtMotherName.Text;
            parents.Email_Father = txtFatherEmail.Text;
            parents.Email_Mother = txtMotherEmail.Text;
            parents.Mobile_Father = txtFatherMobile.Text;
            parents.Mobile_Mother = txtMotherMobile.Text;

            int exists = parentBL.ParentsDetailsExists(parents);

            SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["dbconstr"].ConnectionString);
            con.Open();

            string sql = "SELECT COUNT(*) FROM ParentsDetails WHERE Email_Father = '" + txtFatherEmail.Text + "' AND Mobile_Father = '" + txtFatherMobile.Text + "' " +
                "AND Mobile_Mother = '" + txtMotherMobile.Text + "' AND Email_Mother = '" + txtMotherEmail.Text + "'";


            SqlCommand cmd = new SqlCommand(sql, con);
            //cmd.CommandType = CommandType.StoredProcedure;
            //cmd.CommandText = "spParentsDetailsExist";
            //cmd.Connection = con;

            //cmd.Parameters.AddWithValue("@FatherMobile", txtFatherMobile.Text.Trim());
            //cmd.Parameters.AddWithValue("@FatherEmail", txtFatherEmail.Text.Trim());
            //cmd.Parameters.AddWithValue("@MotherMobile", txtMotherMobile.Text.Trim());
            //cmd.Parameters.AddWithValue("@MotherEmail", txtMotherEmail.Text.Trim());

            exists = int.Parse(cmd.ExecuteScalar().ToString());

            if (exists <= 0)
            {
                NewRegistration();
            }
            else
            {
                ScriptManager.RegisterStartupScript(this, GetType(), "showalert", "alert('Sorry, the Mobile numbers & Email IDs entered has already been used for registration. Please submit the form with new details.');", true);
            }

            
        }   

    }

    protected void btnAdd_Click(object sender, EventArgs e)
    {
        int rowIndex = 0;

        if (ViewState["CurrentControlsList"] != null)
        {
            DataTable dtCurrentControlsList = (DataTable)ViewState["CurrentControlsList"];
            DataRow drCurrentRow = null;
            if (dtCurrentControlsList.Rows.Count > 0)
            {
                for (int i = 1; i <= dtCurrentControlsList.Rows.Count; i++)
                {

                    DropDownList ddlClass =
                      (DropDownList)grid.Rows[rowIndex].Cells[0].FindControl("ddlClass");



                    drCurrentRow = dtCurrentControlsList.NewRow();

                    dtCurrentControlsList.Rows[i - 1]["ddlClass"] = ddlClass.SelectedValue;

                    rowIndex++;
                }
                dtCurrentControlsList.Rows.Add(drCurrentRow);
                ViewState["CurrentTable"] = dtCurrentControlsList;

                grid.DataSource = dtCurrentControlsList;
                grid.DataBind();


            }
        }
        else
        {
            Response.Write("ViewState is null");
        }
        SetPreviousControlsAndData();
    }

    public void SetPreviousControlsAndData()
    {
        int rowIndex = 0;
        if (ViewState["CurrentControlsList"] != null)
        {
            DataTable dt = (DataTable)ViewState["CurrentControlsList"];
            if (dt.Rows.Count > 0)
            {
                for (int i = 0; i < dt.Rows.Count; i++)
                {

                    DropDownList ddlOfferBy =
                      (DropDownList)grid.Rows[rowIndex].Cells[0].FindControl("ddlClass");

                    ddlOfferBy.SelectedValue = dt.Rows[i]["ddlClass"].ToString();

                    rowIndex++;
                }
            }
        }
    }

    private void SetControlData()
    {
        int rowIndex = 0;

        if (ViewState["CurrentControlsList"] != null)
        {
            DataTable dtCurrentTable = (DataTable)ViewState["CurrentControlsList"];
            DataRow drCurrentRow = null;
            if (dtCurrentTable.Rows.Count > 0)
            {
                for (int i = 1; i <= dtCurrentTable.Rows.Count; i++)
                {
                    DropDownList ddlClass =
                     (DropDownList)grid.Rows[rowIndex].Cells[0].FindControl("ddlClass");

                    drCurrentRow = dtCurrentTable.NewRow();


                    dtCurrentTable.Rows[i - 1]["ddlClass"] = ddlClass.SelectedValue;


                    rowIndex++;
                }

                ViewState["CurrentControlsList"] = dtCurrentTable;
                grid.DataSource = dtCurrentTable;
                grid.DataBind();

            }
        }
        else
        {
            Response.Write("ViewState is null");
        }
        SetPreviousControlsAndData();
    }

    protected void grid_RowDeleting(object sender, GridViewDeleteEventArgs e)
    {
        SetControlData();
        if (ViewState["CurrentControlsList"] != null)
        {
            DataTable dt = (DataTable)ViewState["CurrentControlsList"];
            DataRow drCurrentRow = null;
            int rowIndex = Convert.ToInt32(e.RowIndex);
            if (dt.Rows.Count > 1)
            {
                dt.Rows.Remove(dt.Rows[rowIndex]);
                drCurrentRow = dt.NewRow();
                ViewState["CurrentControlsList"] = dt;
                grid.DataSource = dt;
                grid.DataBind();

                SetPreviousControlsAndData();
            }
        }
    }

    static bool isFirstRow = true;

    protected void grid_RowDataBound(object sender, GridViewRowEventArgs e)
    {
        if (e.Row.RowType == DataControlRowType.DataRow)
        {
            DropDownList ddlClass = (DropDownList)e.Row.FindControl("ddlClass");

            ddlClass.DataSource = listClasses;
            ddlClass.DataBind();

            if (e.Row.RowIndex == 0)
            {
                LinkButton LinkButton1 = (LinkButton)e.Row.FindControl("LinkButton1");
                LinkButton1.Visible = false;
                isFirstRow = false;
            }
        }
    }

    public void ClearAllFields(Control parent)
    {

        foreach (Control x in parent.Controls)
        {
            if ((x.GetType() == typeof(TextBox)))
            {

                ((TextBox)(x)).Text = "";
            }

            if ((x.GetType() == typeof(DropDownList)))
            {
                ((DropDownList)(x)).SelectedIndex = 0;
            }

            //if ((x.GetType() == typeof(RadioButtonList)))
            //{
            //    ((RadioButtonList)(x)).SelectedItem.Selected = false;
            //}

            //if ((x.GetType() == typeof(CheckBoxList)))
            //{
            //    ((CheckBoxList)(x)).SelectedItem.Selected = false;
            //}           

            if (x.HasControls())
            {
                ClearAllFields(x);
            }

        }
    }

    protected void btnSubmitMail_Click(object sender, EventArgs e)
    {
        string constr = ConfigurationManager.ConnectionStrings["dbconstr"].ConnectionString;
        SqlConnection con = new SqlConnection(constr);

        con.Open();

        SqlCommand cmd = new SqlCommand("spEmailSubscriptionCreate", con);
        cmd.CommandType = CommandType.StoredProcedure;

        cmd.Parameters.AddWithValue("@Email", txtMailInfo.Value.ToString());

        int res = 0;
        res = cmd.ExecuteNonQuery();

        if (res > 0)
        {
            Page.ClientScript.RegisterStartupScript(this.GetType(), "Alert", "<script>alert('Thank you for your interest. We will get back to you at the earliest.');</script>");
        }
        else
        {
            Page.ClientScript.RegisterStartupScript(this.GetType(), "Alert", "<script>alert('Sorry!!!, there was an unexpected error, please try again.');</script>");
        }
    }

    protected void btnSubmitQuery_Click(object sender, EventArgs e)
    {
        int res = GetQueryDetails();

        if (res != 0)
        {
            SendQueryMailToAdmin();
            Page.ClientScript.RegisterStartupScript(this.GetType(), "Alert", "<script>alert('Thank you for your interest. We will get back to you at the earliest.');</script>");
            txtEmail.Value = "";
            txtMessage.Value = "";
            txtMobile.Value = "";
            txtName.Value = "";
            //Response.Write("Query submitted succesfully!!");

        }
        else
        {
            //Response.Write("Failed to submit");
            Page.ClientScript.RegisterStartupScript(this.GetType(), "Alert", "<script>alert('Sorry!!! There was an unexpected error, please try again!');</script>");
        }
    }

    private int GetQueryDetails()
    {
        QuickQuery query = new QuickQuery();
        QuickQueryBL queryBL = new QuickQueryBL();

        query.Name = txtName.Value.ToString();
        query.Email = txtEmail.Value.ToString();
        query.Mobile = txtMobile.Value.ToString();
        query.Message = txtMessage.Value.ToString();

        return queryBL.Create(query);
    }

    private void SendQueryMailToAdmin()
    {
        SmtpClient mail = new SmtpClient();
        MailMessage message = new MailMessage();

        message.From = new MailAddress("Quick Query@bvminternational.org<inputsfrom@sitequery.info>");

        message.To.Add("info@bvminternational.org");

        if (!String.IsNullOrEmpty(ConfigurationManager.AppSettings["SeminarMailBCC"]))
        {
            message.Bcc.Add(ConfigurationManager.AppSettings["SeminarMailBCC"]);
        }


        message.Subject = "BVM I - Quick Query";
        message.IsBodyHtml = true;

        StringBuilder str = new StringBuilder();

        str.Append("<div style='width: 100%; max-width: 600px; text-align: center;'>");

        str.Append("<br/><br/>");
        str.Append("You have 1 Quick Query, please find details below");
        str.Append("<br/><br/>");

        str.Append("<table>");


        str.Append("<tr>");
        str.Append("<td>Name</td><td>:</td><td> " + txtName.Value + "</td>");
        str.Append("</tr>");

        str.Append("<tr>");
        str.Append("<td>Email</td><td>:</td><td> " + txtEmail.Value + "</td>");
        str.Append("</tr>");

        str.Append("<tr>");
        str.Append("<td>Mobile</td><td>:</td><td> " + txtMobile.Value + "</td>");
        str.Append("</tr>");


        str.Append("<tr>");
        str.Append("<td>Message</td><td>:</td><td> " + txtMessage.Value + "</td>");
        str.Append("</tr>");

        str.Append("</table>");
        str.Append("</div>");

        message.Body = str.ToString();

        mail.Send(message);
    }
}