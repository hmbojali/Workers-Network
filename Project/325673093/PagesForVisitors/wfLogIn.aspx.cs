using System;
using System.Data;
using System.Configuration;
using System.Web;
using System.Web.Security;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Web.UI.WebControls.WebParts;
using System.Web.UI.HtmlControls;
using System.Data.OleDb;
using System.Collections;


public partial class WebForms_wfLogIn : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        
    }
    protected void CheckCustomer()
    {
        try
        {
            Customer customer = new Customer();
            if (customer.ExistCustomer(Login.UserName, true))
            {
                CustomerDetails details = customer.GetCustomerByEmail(Login.UserName);
                if (details.Password == Login.Password)
                {
                    FormsAuthentication.RedirectFromLoginPage("", false);
                    Session["ID"] = details.CustomerID;
                    Response.Redirect("~/PagesForCustomers/wfHomePageCustomer.aspx");
                }
            }
        }
        catch (Exception ex)
        {
            lblErrorMessage.Text = ex.Message;
        }
    }
    protected bool CheckWorker()
    {
        try
        {
            Worker worker = new Worker();
            if (worker.ExistWorker(Login.UserName, true))
            {
                WorkerDetails details = worker.GetWorkerByEmail(Login.UserName);
                if (details.Password == Login.Password)
                {
                    FormsAuthentication.RedirectFromLoginPage("", false);
                    Session["ID"] = details.WorkerID;
                    Response.Redirect("~/PagesForWorkers/wfHomePageWorker.aspx");
                    return true;
                }
            }
        }
        catch (Exception ex)
        {
            lblErrorMessage.Text = ex.Message;
        }
        return false;
    }

    protected void CheckAdmin()
    {
        try
        {
            Admin admin = new Admin();
            if (admin.ExistAdmin(Login.UserName))
            {
                AdminDetails details = admin.GetAdminByEmail(Login.UserName);
                if (details.Password == Login.Password)
                {
                    FormsAuthentication.RedirectFromLoginPage("", false);
                    Session["AdminID"] = details.AdminID;
                    Response.Redirect("~/PagesForAdmin/wfHomePageAdmin.aspx");
                }
            }
        }
        catch (Exception ex)
        {
            lblErrorMessage.Text = ex.Message;
        }
    }


    protected void Login_Authenticate(object sender, AuthenticateEventArgs e)
    {
        if(bool.Parse(Session["IsCustomer"].ToString()))
        {
            CheckCustomer();
        }
        else if (!CheckWorker())
        {
            CheckAdmin();
        }
    }
}