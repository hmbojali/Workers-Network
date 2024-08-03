using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class PagesForAdmin_wfUpdDelWorkerAttributes : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (Session["AdminID"] == null)
            Response.Redirect("~/PagesForVisitors/wfStartingPage.aspx");
    }

    protected void btnWorkerAttributes_Click(object sender, EventArgs e)
    {
        Response.Redirect("~/PagesForAdmin/wfUpdDelWorkerAttributes.aspx");
    }
}