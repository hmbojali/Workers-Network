using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class PagesForVisitors_wfStartingPage : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {

    }

    protected void btnCustomer_Click(object sender, EventArgs e)
    {
        Session["IsCustomer"] = "true";
        Response.Redirect("~/PagesForCustomers/wfCustomerSignup.aspx");
    }

    protected void btnWorker_Click(object sender, EventArgs e)
    {
        Session["IsCustomer"] = "false";
        Response.Redirect("~/PagesForWorkers/wfWorkerSignup.aspx");
    }
}