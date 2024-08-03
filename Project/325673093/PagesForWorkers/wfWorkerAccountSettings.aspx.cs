using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class PagesForWorkers_wfWorkerAccountSettings : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            string id = Session["ID"].ToString();
            Worker worker = new Worker();
            txtbxEmail.Text = worker.GetWorkerByID(id).Email;
        }
    }
    protected void btnSumbit_Click(object sender, EventArgs e)
    {
        lblErrorMessage.Visible = false;

        string id = Session["ID"].ToString();
        Worker worker = new Worker();
        WorkerDetails details = worker.GetWorkerByID(id);
        if (txtbxVerification.Text == details.Password)
        {
            bool ValidData = false;

            if (txtbxEmail.Text != "")
            {
                if (worker.ExistWorker(txtbxEmail.Text, true))
                {
                    if (txtbxEmail.Text == details.Email)
                    {
                        if (txtbxPassword.Text != "")
                        {
                            if (txtbxPassword.Text != txtbxPasswordAgain.Text)
                            {
                                ValidData = false;
                                lblErrorMessage.Text = "The Passwords You Entered Don't Match!";
                                lblErrorMessage.Visible = true;
                                txtbxPassword.BorderColor = System.Drawing.Color.Red;
                                txtbxPasswordAgain.BorderColor = System.Drawing.Color.Red;
                            }
                            else
                            {
                                ValidData = true;
                                details.Email = txtbxEmail.Text;
                                details.Password = txtbxPassword.Text;
                            }
                        }
                    }
                    else
                    {
                        ValidData = false;
                        lblErrorMessage.Text = "A Customer With The Same Email Already Exists!";
                        lblErrorMessage.Visible = true;
                        txtbxEmail.BorderColor = System.Drawing.Color.Red;
                    }
                }
                else
                {
                    if (txtbxPassword.Text != "")
                    {
                        if (txtbxPassword.Text != txtbxPasswordAgain.Text)
                        {
                            ValidData = false;
                            lblErrorMessage.Text = "The Passwords You Entered Don't Match!";
                            lblErrorMessage.Visible = true;
                            txtbxPassword.BorderColor = System.Drawing.Color.Red;
                            txtbxPasswordAgain.BorderColor = System.Drawing.Color.Red;
                        }
                        else
                        {
                            ValidData = true;
                            details.Email = txtbxEmail.Text;
                            details.Password = txtbxPassword.Text;
                        }
                    }
                }
            }

            if (ValidData)
            {
                worker.UpdateAllPrivateDetails(details);
            }
            else if (lblErrorMessage.Visible == false)
            {
                lblErrorMessage.Text = "Some Values Are Missing!";
                lblErrorMessage.Visible = true;
            }
        }
        else
        {
            lblErrorMessage.Text = "Verification Password Is Wrong!";
            lblErrorMessage.Visible = true;
        }
    }
}