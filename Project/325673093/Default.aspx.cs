using System;
using System.Data;
using System.Configuration;
using System.Collections;
using System.Web;
using System.Web.Security;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Web.UI.WebControls.WebParts;
using System.Web.UI.HtmlControls;
using System.IO;
public partial class _Default : System.Web.UI.Page
{
    protected string ArrayStore = "";
    protected void Page_Load(object sender, EventArgs e)
    {
        this.ArrayStore = Request.Form["ArrayStore"];
    }

    protected void btnCS_Click(object sender, EventArgs e)
    {
        if(lbl.Text=="yes")
        {
            lbl.Text = "no";
        }
        else
        {
            lbl.Text = "yes";
        }
    }
}