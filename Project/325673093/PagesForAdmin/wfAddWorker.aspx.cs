using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class PagesForAdmin_wfAddWorker : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        this.Form.DefaultButton = btnAdd.UniqueID;
        if (Session["AdminID"] == null)
            Response.Redirect("~/PagesForVisitors/wfStartingPage.aspx");
    }
    public DateTime StringToDate(string str)
    {
        DateTime date;
        int day, month, year;
        day = int.Parse(str.Substring(0, str.IndexOf("/")));
        str = str.Substring(str.IndexOf("/") + 1);
        month = int.Parse(str.Substring(0, str.IndexOf("/")));
        str = str.Substring(str.IndexOf("/") + 1);
        year = int.Parse(str);
        date = new DateTime(year, month, day);
        return date;
    }

    protected void btnAdd_Click(object sender, EventArgs e)
    {
        lblErrorMessage.Visible = false;
        txtbxEmail.BorderColor = System.Drawing.Color.FromArgb(255, 119, 0);
        txtbxPassword.BorderColor = System.Drawing.Color.FromArgb(255, 119, 0);
        txtbxWorkerID.BorderColor = System.Drawing.Color.FromArgb(255, 119, 0);
        txtbxDateOfBirth.BorderColor = System.Drawing.Color.FromArgb(255, 119, 0);
        txtbxPhoneNumber.BorderColor = System.Drawing.Color.FromArgb(255, 119, 0);

        Worker worker = new Worker();
        Admin admin = new Admin();
        if (worker.ExistWorker(txtbxEmail.Text, true))
        {
            lblErrorMessage.Visible = true;
            txtbxEmail.BorderColor = System.Drawing.Color.Red;
            lblErrorMessage.Text = "A Worker With The Same Email Already Exists!";
            return;
        }
        else if (admin.ExistAdmin(txtbxEmail.Text))
        {
            lblErrorMessage.Visible = true;
            txtbxEmail.BorderColor = System.Drawing.Color.Red;
            lblErrorMessage.Text = "Someone With The Same Email Already Exists!";
            return;
        }
        else if (txtbxEmail.Text == "")
        {
            lblErrorMessage.Visible = true;
            txtbxEmail.BorderColor = System.Drawing.Color.Red;
            lblErrorMessage.Text = "Emails Can't Be Empty!";
            return;
        }
        else if (txtbxPassword.Text == "")
        {
            lblErrorMessage.Visible = true;
            txtbxPassword.BorderColor = System.Drawing.Color.Red;
            lblErrorMessage.Text = "Passwords Can't Be Empty!";
            return;
        }
        if (worker.ExistWorker(txtbxWorkerID.Text))
        {
            lblErrorMessage.Visible = true;
            txtbxWorkerID.BorderColor = System.Drawing.Color.Red;
            lblErrorMessage.Text = "A Worker With The Same ID Number Already Exists!";
            return;
        }
        else if (txtbxWorkerID.Text == "")
        {
            lblErrorMessage.Visible = true;
            txtbxWorkerID.BorderColor = System.Drawing.Color.Red;
            lblErrorMessage.Text = "ID Numbers Can't Be Empty!";
            return;
        }
        else if (this.txtbxFirstName.Text == "" || this.txtbxLastName.Text == "")
        {
            lblErrorMessage.Visible = true;
            this.txtbxFirstName.BorderColor = System.Drawing.Color.Red;
            this.txtbxLastName.BorderColor = System.Drawing.Color.Red;
            lblErrorMessage.Text = "Names Can't Be Empty!";
            return;
        }
        else
        {
            try
            {
                DateTime date = StringToDate(txtbxDateOfBirth.Text);
            }
            catch
            {
                lblErrorMessage.Visible = true;
                lblErrorMessage.Text = "Please Enter A Proper Date Value In \"Birth date\"";
                txtbxDateOfBirth.BorderColor = System.Drawing.Color.Red;
                return;
            }
        }

        try
        {
            int isOkay = int.Parse(txtbxPhoneNumber.Text);
        }
        catch
        {
            lblErrorMessage.Visible = true;
            lblErrorMessage.Text = "Please Enter A Proper Phone Number Value";
            txtbxPhoneNumber.BorderColor = System.Drawing.Color.Red;
            return;
        }
        bool ValidData = true;

        if (txtbxUserName.Text == "")
        {
            ValidData = false;
            lblErrorMessage.Visible = true;
            txtbxUserName.BorderColor = System.Drawing.Color.Red;
            lblErrorMessage.Text = "Usernames Can't Be Empty!";
            return;
        }
        else if (txtbxPhoneNumber.Text == "")
        {
            ValidData = false;
            lblErrorMessage.Visible = true;
            txtbxPhoneNumber.BorderColor = System.Drawing.Color.Red;
            lblErrorMessage.Text = "Phone Numbers Can't Be Empty!";
            return;
        }
        else if (txtbxProfession.Text == "")
        {
            ValidData = false;
            lblErrorMessage.Visible = true;
            txtbxProfession.BorderColor = System.Drawing.Color.Red;
            lblErrorMessage.Text = "Professions Can't Be Empty!";
            return;
        }
        if (ValidData)
        {
            WorkerDetails workerDetails = new WorkerDetails();
            WorkerAttributesDetails attributesDetails = new WorkerAttributesDetails();
            WorkerAttributes workerAttributes = new WorkerAttributes();
            workerDetails.Email = txtbxEmail.Text;
            workerDetails.Password = txtbxPassword.Text;
            workerDetails.DateOfBirth = StringToDate(txtbxDateOfBirth.Text);
            workerDetails.WorkerID = txtbxWorkerID.Text;
            attributesDetails.WorkerID = txtbxWorkerID.Text;
            workerDetails.FirstName = txtbxFirstName.Text;
            workerDetails.LastName = txtbxLastName.Text;
            workerDetails.UserName = txtbxUserName.Text;
            workerDetails.PhoneNumber = txtbxPhoneNumber.Text;
            workerDetails.Profession = txtbxProfession.Text;
            attributesDetails.Tags = "#" + txtbxProfession.Text;

            try
            {
                worker.AddWorker(workerDetails);
                workerAttributes.AddWorkerAttributes(attributesDetails);
            }
            catch
            {
                lblErrorMessage.Visible = true;
                lblErrorMessage.Text = "An Error Occured. Please try again.";
            }
        }
    }
}
