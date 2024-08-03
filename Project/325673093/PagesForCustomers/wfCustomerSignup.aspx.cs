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
using System.Globalization;
using System.Xml;
using System.Net;

public partial class PagesForCustomers_wfCustomerSignup : System.Web.UI.Page
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
        inputCustomerID.BorderColor = System.Drawing.Color.FromArgb(255, 119, 0);
        inputDateOfBirth.BorderColor = System.Drawing.Color.FromArgb(255, 119, 0);
        inputPhoneNumber.BorderColor = System.Drawing.Color.FromArgb(255, 119, 0);

        Customer customer = new Customer();
        if (lblEmail.Visible)
        {
            if (customer.ExistCustomer(inputEmail.Text, true))
            {
                lblErrorMessage.Visible = true;
                inputEmail.BorderColor = System.Drawing.Color.Red;
                lblErrorMessage.Text = "A Customer With The Same Email Already Exists!";
            }
            else if (inputEmail.Text == "")
            {
                lblErrorMessage.Visible = true;
                inputEmail.BorderColor = System.Drawing.Color.Red;
                lblErrorMessage.Text = "Emails Can't Be Empty!";
            }
            else if (inputPassword.Text != inputPasswordAgain.Text)
            {
                lblErrorMessage.Visible = true;
                inputPassword.BorderColor = System.Drawing.Color.Red;
                inputPasswordAgain.BorderColor = System.Drawing.Color.Red;
                lblErrorMessage.Text = "Passwords Don't Match!";
            }
            else if (inputPassword.Text == "")
            {
                lblErrorMessage.Visible = true;
                inputPassword.BorderColor = System.Drawing.Color.Red;
                inputPasswordAgain.BorderColor = System.Drawing.Color.Red;
                lblErrorMessage.Text = "Passwords Can't Be Empty!";
            }
            else
            {
                inputPassword.TextMode = TextBoxMode.SingleLine;
                inputEmail.Visible = false;
                ValidatorEmail.Visible = false;
                inputPassword.Visible = false;
                inputPasswordAgain.Visible = false;
                lblPassword.Visible = false;
                lblEmail.Visible = false;


                lblCustomerID.Visible = true;
                ValidatorID.Visible = true;
                lblName.Visible = true;
                lblDateOfBirth.Visible = true;
                inputCustomerID.Visible = true;
                inputFirstName.Visible = true;
                inputLastName.Visible = true;
                inputDateOfBirth.Visible = true;
            }
        }
        else if (inputCustomerID.Visible)
        {
            if (customer.ExistCustomer(inputCustomerID.Text))
            {
                lblErrorMessage.Visible = true;
                inputCustomerID.BorderColor = System.Drawing.Color.Red;
                lblErrorMessage.Text = "A Customer With The Same ID Number Already Exists!";
            }
            else if (inputCustomerID.Text == "")
            {
                lblErrorMessage.Visible = true;
                inputCustomerID.BorderColor = System.Drawing.Color.Red;
                lblErrorMessage.Text = "ID Numbers Can't Be Empty!";
            }
            else if (inputFirstName.Text == "" || inputLastName.Text == "")
            {
                lblErrorMessage.Visible = true;
                inputFirstName.BorderColor = System.Drawing.Color.Red;
                inputLastName.BorderColor = System.Drawing.Color.Red;
                lblErrorMessage.Text = "Names Can't Be Empty!";
            }
            else
            {
                try
                {
                    DateTime date = StringToDate(inputDateOfBirth.Text);


                    inputCustomerID.Visible = false;
                    ValidatorID.Visible = false;
                    inputDateOfBirth.Visible = false;
                    inputFirstName.Visible = false;
                    inputLastName.Visible = false;
                    lblCustomerID.Visible = false;
                    lblDateOfBirth.Visible = false;
                    lblName.Visible = false;

                    lblUserName.Visible = true;
                    inputUserName.Visible = true;
                    lblPhoneNumber.Visible = true;
                    inputPhoneNumber.Visible = true;
                    ValidatorPhoneNumber.Visible = true;
                    lblAddressDescription.Visible = true;
                    inputAddressDescription.Visible = true;
                    btnSumbit.Text = "Submit";
                }
                catch
                {
                    lblErrorMessage.Visible = true;
                    lblErrorMessage.Text = "Please Enter A Proper Date Value In \"Birth date\"";
                    inputDateOfBirth.BorderColor = System.Drawing.Color.Red;
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
            }
            bool ValidData = true;

            if (inputUserName.Text == "")
            {
                ValidData = false;
                lblErrorMessage.Visible = true;
                inputUserName.BorderColor = System.Drawing.Color.Red;
                lblErrorMessage.Text = "Usernames Can't Be Empty!";
            }
            else if (inputPhoneNumber.Text == "")
            {
                ValidData = false;
                lblErrorMessage.Visible = true;
                inputPhoneNumber.BorderColor = System.Drawing.Color.Red;
                lblErrorMessage.Text = "Phone Numbers Can't Be Empty!";
            }
            else if (inputAddressDescription.Text == "")
            {
                ValidData = false;
                lblErrorMessage.Visible = true;
                inputAddressDescription.BorderColor = System.Drawing.Color.Red;
                lblErrorMessage.Text = "Cities Can't Be Empty!";
            }

            if (ValidData)
            {
                CustomerDetails customerDetails = new CustomerDetails();
                customerDetails.Email = inputEmail.Text;

                customerDetails.Password = inputPassword.Text;
                inputPassword.TextMode = TextBoxMode.Password;

                customerDetails.DateOfBirth = StringToDate(inputDateOfBirth.Text);
                customerDetails.CustomerID = inputCustomerID.Text;
                customerDetails.FirstName = inputFirstName.Text;
                customerDetails.LastName = inputLastName.Text;
                customerDetails.UserName = inputUserName.Text;
                customerDetails.PhoneNumber = inputPhoneNumber.Text;
                customerDetails.AddressDescription = inputAddressDescription.Text;


                try
                {
                    customer.AddCustomer(customerDetails);
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