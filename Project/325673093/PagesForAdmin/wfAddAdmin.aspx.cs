using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class PagesForAdmin_wfAddAdmin : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        this.Form.DefaultButton = btnAdd.UniqueID;
        if (Session["AdminID"] == null)
            Response.Redirect("~/PagesForVisitors/wfStartingPage.aspx");
    }

    protected void btnAdd_Click(object sender, EventArgs e)
    {
        lblErrorMessage.Visible = false;
        if (txtbxFirstName.Text == "")
        {
            lblErrorMessage.Visible = true;
            txtbxFirstName.BorderColor = System.Drawing.Color.Red;
            lblErrorMessage.Text = "First Name Can't Be Empty!";
        }
        else if (txtbxLastName.Text == "")
        {
            lblErrorMessage.Visible = true;
            lblLastName.BorderColor = System.Drawing.Color.Red;
            lblErrorMessage.Text = "Last Name Can't Be Empty!";
        }
        else if (txtbxEmail.Text == "")
        {
            lblErrorMessage.Visible = true;
            txtbxEmail.BorderColor = System.Drawing.Color.Red;
            lblErrorMessage.Text = "Email Can't Be Empty!";
        }
        else if (txtbxUserName.Text == "")
        {
            lblErrorMessage.Visible = true;
            txtbxUserName.BorderColor = System.Drawing.Color.Red;
            lblErrorMessage.Text = "Username Can't Be Empty!";
        }
        else if (txtbxPassword.Text == "")
        {
            lblErrorMessage.Visible = true;
            txtbxPassword.BorderColor = System.Drawing.Color.Red;
            lblErrorMessage.Text = "Password Can't Be Empty!";
        }
        else
        {
            Admin admin = new Admin();
            AdminDetails details = new AdminDetails();
            details.FirstName = txtbxFirstName.Text;
            details.LastName = txtbxLastName.Text;
            details.Email = txtbxEmail.Text;
            details.UserName = txtbxUserName.Text;
            details.Password = txtbxPassword.Text;
            if (!admin.ExistAdmin(details))
            {
                Worker worker = new Worker();
                if (!worker.ExistWorker(details.Email, true))
                    admin.AddAdmin(details);
                else
                {
                    lblErrorMessage.Visible = true;
                    txtbxEmail.BorderColor = System.Drawing.Color.Red;
                    lblErrorMessage.Text = "Someone With The Same Email Already Exists!";
                }
            }
            else
            {
                lblErrorMessage.Visible = true;
                txtbxEmail.BorderColor = System.Drawing.Color.Red;
                lblErrorMessage.Text = "An Admin With The Same Email Already Exists!";
            }
        }
    }
}