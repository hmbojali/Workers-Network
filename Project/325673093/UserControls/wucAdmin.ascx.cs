using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class UserControls_wucAdmin : System.Web.UI.UserControl
{
    protected void Page_Load(object sender, EventArgs e)
    {
        
    }
    protected void btnHomePage_Click(object sender, EventArgs e)
    {
        Server.Transfer("~/PagesForAdmin/wfHomePageAdmin.aspx");//CHANGE
    }
    protected void btnSignout_Click(object sender, ImageClickEventArgs e)
    {
        Session.RemoveAll();
        Response.Redirect("~/PagesForVisitors/wfStartingPage.aspx");
    }
}