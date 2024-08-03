using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Configuration;
using System.Web.Security;
using System.Web.UI.WebControls.WebParts;
using System.Web.UI.HtmlControls;
using System.Data.OleDb;
using System.Collections;

public partial class PagesForWorkers_wfWorkerSignup : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {

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

    protected void btnSumbit_Click(object sender, EventArgs e)
    {
        lblErrorMessage.Visible = false;
        inputEmail.BorderColor = System.Drawing.Color.FromArgb(255, 119, 0);
        inputPassword.BorderColor = System.Drawing.Color.FromArgb(255, 119, 0);
        inputPasswordAgain.BorderColor = System.Drawing.Color.FromArgb(255, 119, 0);
        inputWokerID.BorderColor = System.Drawing.Color.FromArgb(255, 119, 0);
        inputDateOfBirth.BorderColor = System.Drawing.Color.FromArgb(255, 119, 0);
        inputPhoneNumber.BorderColor = System.Drawing.Color.FromArgb(255, 119, 0);

        Worker worker = new Worker();
        if (lblEmail.Visible)
        {
            Admin admin = new Admin();
            if (worker.ExistWorker(inputEmail.Text, true))
            {
                lblErrorMessage.Visible = true;
                inputEmail.BorderColor = System.Drawing.Color.Red;
                lblErrorMessage.Text = "A Worker With The Same Email Already Exists!";
                return;
            }
            else if (admin.ExistAdmin(inputEmail.Text))
            {
                lblErrorMessage.Visible = true;
                inputEmail.BorderColor = System.Drawing.Color.Red;
                lblErrorMessage.Text = "Someone With The Same Email Already Exists!";
                return;
            }
            else if (inputEmail.Text == "")
            {
                lblErrorMessage.Visible = true;
                inputEmail.BorderColor = System.Drawing.Color.Red;
                lblErrorMessage.Text = "Emails Can't Be Empty!";
                return;
            }
            else if (inputPassword.Text != inputPasswordAgain.Text)
            {
                lblErrorMessage.Visible = true;
                inputPassword.BorderColor = System.Drawing.Color.Red;
                inputPasswordAgain.BorderColor = System.Drawing.Color.Red;
                lblErrorMessage.Text = "Passwords Don't Match!";
                return;
            }
            else if (inputPassword.Text == "")
            {
                lblErrorMessage.Visible = true;
                inputPassword.BorderColor = System.Drawing.Color.Red;
                inputPasswordAgain.BorderColor = System.Drawing.Color.Red;
                lblErrorMessage.Text = "Passwords Can't Be Empty!";
                return;
            }
            else
            {
                inputEmail.Visible = false;
                ValidatorEmail.Visible = false;
                inputPassword.Visible = false;
                inputPasswordAgain.Visible = false;
                lblPassword.Visible = false;
                lblEmail.Visible = false;


                lblWorkerID.Visible = true;
                ValidatorID.Visible = true;
                lblName.Visible = true;
                lblDateOfBirth.Visible = true;
                inputWokerID.Visible = true;
                inputFirstName.Visible = true;
                inputLastName.Visible = true;
                inputDateOfBirth.Visible = true;
            }
        }
        else if (lblWorkerID.Visible)
        {
            if (worker.ExistWorker(inputWokerID.Text))
            {
                lblErrorMessage.Visible = true;
                inputWokerID.BorderColor = System.Drawing.Color.Red;
                lblErrorMessage.Text = "A Worker With The Same ID Number Already Exists!";
                return;
            }
            else if (inputWokerID.Text == "")
            {
                lblErrorMessage.Visible = true;
                inputWokerID.BorderColor = System.Drawing.Color.Red;
                lblErrorMessage.Text = "ID Numbers Can't Be Empty!";
                return;
            }
            else if (inputFirstName.Text == "" || inputLastName.Text == "")
            {
                lblErrorMessage.Visible = true;
                inputFirstName.BorderColor = System.Drawing.Color.Red;
                inputLastName.BorderColor = System.Drawing.Color.Red;
                lblErrorMessage.Text = "Names Can't Be Empty!";
                return;
            }
            else
            {
                try
                {
                    DateTime date = StringToDate(inputDateOfBirth.Text);


                    inputWokerID.Visible = false;
                    ValidatorID.Visible = false;
                    inputDateOfBirth.Visible = false;
                    inputFirstName.Visible = false;
                    inputLastName.Visible = false;
                    lblWorkerID.Visible = false;
                    lblDateOfBirth.Visible = false;
                    lblName.Visible = false;

                    lblUserName.Visible = true;
                    inputUserName.Visible = true;
                    lblPhoneNumber.Visible = true;
                    ValidatorPhoneNumber.Visible = true;
                    inputPhoneNumber.Visible = true;
                    lblProfession.Visible = true;
                    inputProfession.Visible = true;
                    btnSumbit.Text = "Submit";
                }
                catch
                {
                    lblErrorMessage.Visible = true;
                    lblErrorMessage.Text = "Please Enter A Proper Date Value In \"Birth date\"";
                    inputDateOfBirth.BorderColor = System.Drawing.Color.Red;
                    return;
                }
            }
        }
        else
        {

            try
            {
                int isOkay = int.Parse(inputPhoneNumber.Text);
            }
            catch
            {
                lblErrorMessage.Visible = true;
                lblErrorMessage.Text = "Please Enter A Proper Phone Number Value";
                inputPhoneNumber.BorderColor = System.Drawing.Color.Red;
                return;
            }
            bool ValidData = true;

            if (inputUserName.Text == "")
            {
                ValidData = false;
                lblErrorMessage.Visible = true;
                inputUserName.BorderColor = System.Drawing.Color.Red;
                lblErrorMessage.Text = "Usernames Can't Be Empty!";
                return;
            }
            else if (inputPhoneNumber.Text == "")
            {
                ValidData = false;
                lblErrorMessage.Visible = true;
                inputPhoneNumber.BorderColor = System.Drawing.Color.Red;
                lblErrorMessage.Text = "Phone Numbers Can't Be Empty!";
                return;
            }
            else if (inputProfession.Text == "")
            {
                ValidData = false;
                lblErrorMessage.Visible = true;
                inputProfession.BorderColor = System.Drawing.Color.Red;
                lblErrorMessage.Text = "Professions Can't Be Empty!";
                return;
            }

            if (ValidData)
            {
                WorkerDetails workerDetails = new WorkerDetails();
                WorkerAttributesDetails attributesDetails = new WorkerAttributesDetails();
                WorkerAttributes workerAttributes = new WorkerAttributes();
                workerDetails.Email = inputEmail.Text;
                workerDetails.Password = inputPassword.Text;
                workerDetails.DateOfBirth = StringToDate(inputDateOfBirth.Text);
                workerDetails.WorkerID = inputWokerID.Text;
                attributesDetails.WorkerID = inputWokerID.Text;
                workerDetails.FirstName = inputFirstName.Text;
                workerDetails.LastName = inputLastName.Text;
                workerDetails.UserName = inputUserName.Text;
                workerDetails.PhoneNumber = inputPhoneNumber.Text;
                workerDetails.Profession = inputProfession.Text;
                attributesDetails.Tags = "#" + inputProfession.Text;

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

                Server.Transfer("~/PagesForVisitors/wfLogin.aspx");
            }
        }
    }
    protected void lnkToLogin_Click(object sender, EventArgs e)
    {
        Server.Transfer("~/PagesForVisitors/wfLogIn.aspx");
    }

}