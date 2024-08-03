using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Configuration;
using System.Web.Security;
using System.Data.OleDb;
using System.Collections;
using System.Globalization;
using System.Xml;
using System.Net;

public partial class PagesForCustomers_wfCustomerProfileSettings : System.Web.UI.Page
{
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
    public string DateToString(DateTime dt)
    {
        string res = dt.Day + "/" + dt.Month + "/" + dt.Year;
        return res;
    }

    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            Session["Verified"] = "false";
        }
    }

    protected void btnSumbit_Click(object sender, EventArgs e)
    {
        lblErrorMessage.Visible = false;


        txtbxBirthDate.BorderColor = System.Drawing.Color.FromArgb(255, 153, 34);
        txtbxPhoneNumber.BorderColor = System.Drawing.Color.FromArgb(255, 153, 34);
        txtbxAddressDescription.BorderColor = System.Drawing.Color.FromArgb(255, 153, 34);
        txtbxPassword.BorderColor = System.Drawing.Color.FromArgb(255, 153, 34);
        txtbxPasswordAgain.BorderColor = System.Drawing.Color.FromArgb(255, 153, 34);
        txtbxVerification.BorderColor = System.Drawing.Color.FromArgb(255, 153, 34);

        string id = Session["ID"].ToString();
        Customer customer = new Customer();
        CustomerDetails details = customer.GetCustomerByID(id);
        if (!bool.Parse(Session["Verified"].ToString()) && txtbxVerification.Text == details.Password)
        {
            txtbxUsername.Text = details.UserName;
            txtbxName.Text = details.FirstName + " " + details.LastName;

            txtbxBirthDate.Text = DateToString(details.DateOfBirth);

            txtbxPhoneNumber.Text = details.PhoneNumber;
            txtbxEmail.Text = details.Email;
            txtbxAddressDescription.Text = details.AddressDescription;
            Session["Verified"] = "true";
        }
        else if (txtbxVerification.Text == details.Password)
        {
            bool ValidData = false;

            if (txtbxUsername.Text != "")
            {
                if (txtbxPhoneNumber.Text != "")
                {
                    if (txtbxEmail.Text != "")
                    {
                        if (customer.ExistCustomer(txtbxEmail.Text, true))
                        {
                            if (txtbxEmail.Text == details.Email)
                            {
                                if (txtbxName.Text.Substring(0, txtbxName.Text.IndexOf(" ")) != "")
                                {
                                    if (txtbxName.Text.Substring(txtbxName.Text.IndexOf(" ") + 1) != "")
                                    {

                                        if (txtbxAddressDescription.Text != "")
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
                                                    ValidData = true; //all textboxes are filled with something other than the birthday. data is valid temporarily
                                                    details.UserName = txtbxUsername.Text;
                                                    details.PhoneNumber = txtbxPhoneNumber.Text;
                                                    details.Email = txtbxEmail.Text; details.FirstName = txtbxName.Text.Substring(0, txtbxName.Text.IndexOf(" ")); details.LastName = txtbxName.Text.Substring(txtbxName.Text.IndexOf(" ") + 1);
                                                    details.FirstName = txtbxName.Text.Substring(0, txtbxName.Text.IndexOf(" "));
                                                    details.LastName = txtbxName.Text.Substring(txtbxName.Text.IndexOf(" ") + 1);
                                                    details.AddressDescription = txtbxAddressDescription.Text;
                                                    details.Password = txtbxPassword.Text;
                                                }
                                            }
                                            else
                                            {
                                                ValidData = true; //all textboxes are filled with something other than the birthday and password. data is valid temporarily
                                                details.UserName = txtbxUsername.Text;
                                                details.PhoneNumber = txtbxPhoneNumber.Text;
                                                details.Email = txtbxEmail.Text; details.FirstName = txtbxName.Text.Substring(0, txtbxName.Text.IndexOf(" ")); details.LastName = txtbxName.Text.Substring(txtbxName.Text.IndexOf(" ") + 1);
                                                details.FirstName = txtbxName.Text.Substring(0, txtbxName.Text.IndexOf(" "));
                                                details.LastName = txtbxName.Text.Substring(txtbxName.Text.IndexOf(" ") + 1);
                                                details.AddressDescription = txtbxAddressDescription.Text;
                                            }
                                        }
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
                            if (txtbxName.Text.Substring(0, txtbxName.Text.IndexOf(" ")) != "")
                            {
                                if (txtbxName.Text.Substring(txtbxName.Text.IndexOf(" ") + 1) != "")
                                {
                                    if (txtbxAddressDescription.Text != "")
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
                                                ValidData = true; //all textboxes are filled with something other than the birthday. data is valid temporarily
                                                details.UserName = txtbxUsername.Text;
                                                details.PhoneNumber = txtbxPhoneNumber.Text;
                                                details.Email = txtbxEmail.Text; details.FirstName = txtbxName.Text.Substring(0, txtbxName.Text.IndexOf(" ")); details.LastName = txtbxName.Text.Substring(txtbxName.Text.IndexOf(" ") + 1);
                                                details.FirstName = txtbxName.Text.Substring(0, txtbxName.Text.IndexOf(" "));
                                                details.LastName = txtbxName.Text.Substring(txtbxName.Text.IndexOf(" ") + 1);
                                                details.AddressDescription = txtbxAddressDescription.Text;
                                                details.Password = txtbxPassword.Text;
                                            }
                                        }
                                        else
                                        {
                                            ValidData = true; //all textboxes are filled with something other than the birthday and password. data is valid temporarily
                                            details.UserName = txtbxUsername.Text;
                                            details.PhoneNumber = txtbxPhoneNumber.Text;
                                            details.Email = txtbxEmail.Text; details.FirstName = txtbxName.Text.Substring(0, txtbxName.Text.IndexOf(" ")); details.LastName = txtbxName.Text.Substring(txtbxName.Text.IndexOf(" ") + 1);
                                            details.FirstName = txtbxName.Text.Substring(0, txtbxName.Text.IndexOf(" "));
                                            details.LastName = txtbxName.Text.Substring(txtbxName.Text.IndexOf(" ") + 1);
                                            details.AddressDescription = txtbxAddressDescription.Text;
                                        }
                                    }
                                }
                            }
                        }
                    }
                }
            }
            try //making sure the birth day value is alright. if not, data is not valid.
            {
                if (txtbxBirthDate.Text != "")
                    details.DateOfBirth = StringToDate(txtbxBirthDate.Text);//trying to convert the string value to date value
                else
                    ValidData = false;
            }
            catch// activates when string value is not a proper date value
            {
                ValidData = false;
                lblErrorMessage.Text = "Please Enter A Proper Date Value In \"Birth date\"";
                lblErrorMessage.Visible = true;
                txtbxBirthDate.BorderColor = System.Drawing.Color.Red;
            }





            if (ValidData)
            {
                customer.UpdateAllDetails(details);
            }
            else
            {
                lblErrorMessage.Text = "Some Values Are Not Valid!";
                lblErrorMessage.Visible = true;
            }
        }
        else
        {
            lblErrorMessage.Text = "The Verification Password Is Wrong!";
            lblErrorMessage.Visible = true;
            txtbxVerification.BorderColor = System.Drawing.Color.Red;
        }

    }
}