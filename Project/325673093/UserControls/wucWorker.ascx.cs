using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class UserControls_wucCustomer : System.Web.UI.UserControl
{
    protected void Page_Load(object sender, EventArgs e)
    {
        
    }
    protected void btnHomePage_Click(object sender, EventArgs e)
    {
        Server.Transfer("/PagesForWorkers/wfHomePageWorker.aspx");
    }
    protected void btnProfileSettings_Click(object sender, ImageClickEventArgs e)
    {
        Server.Transfer("~/PagesForWorkers/wfWorkerProfileSettings.aspx");
    }



    protected void btnSignout_Click(object sender, ImageClickEventArgs e)
    {
        Session.RemoveAll();
        Response.Redirect("~/PagesForVisitors/wfStartingPage.aspx");
    }
    protected void SearchEvent(object sender, EventArgs e)
    {
        Session["Search"] = txtbxSearchBar.Text;
        Server.Transfer("~/PagesForWorkers/wfSearchPageWorker.aspx");
    }
}