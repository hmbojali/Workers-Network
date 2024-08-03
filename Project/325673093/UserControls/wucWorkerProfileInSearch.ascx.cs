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
using System.Web.Configuration;

public partial class wucWorkerProfileInSearch : System.Web.UI.UserControl
{
    protected void Page_Load(object sender, EventArgs e)
    {
        
    }
    
    public wucWorkerProfileInSearch Clone()
    {
        wucWorkerProfileInSearch other = (wucWorkerProfileInSearch)this.MemberwiseClone();
        other.ID = string.Copy(this.ID);
        return other;
    }
    private string targetURL;
    private string workerID;
    public string TargetURL
    {
        get { return targetURL; }
        set { targetURL = value; }
    }
    public string WorkerID
    {
        get { return workerID; }
        set { workerID = value; }
    }
    public Image PFP
    {
        get { return imgPFP; }
        set { imgPFP = value; }
    }
    public Label Username
    {
        get { return lblUsername; }
        set { lblUsername = value; }
    }
    public Label Name
    {
        get{ return lblName;}
        set{ lblName = value;}
    }
    public Label Profession
    {
        get{ return lblProfession;}
        set{ lblProfession = value;}
    }
    public Label Status
    {
        get { return lblStatus; }
        set { lblStatus = value; }
    }
    public Label Rating
    {
        get { return lblOverAllRating; }
        set { lblOverAllRating = value; }
    }
    public Label TimesRated
    {
        get { return lblTimesRated; }
        set { lblTimesRated = value; }
    }

    public int MarginBottom
    {
        get
        {
            try
            {
                HtmlControl div = (HtmlControl)lblName.Parent.FindControl("div");
                string style = div.Attributes["style"];
                style = style.Substring(style.IndexOf("margin-bottom") + 14);

                string res = "";
                while (char.IsDigit(style[0]))
                {
                    res += style[0];
                    style = style.Substring(1);
                }
                return int.Parse(res);
            }
            catch
            {
                return 0;
            }
        }
        set
        {
            HtmlControl div = (HtmlControl)lblName.Parent.FindControl("div");
            string style = div.Attributes["style"];
            string newStyle;
            newStyle = style.Substring(0, style.IndexOf("margin-bottom"));
            style = style.Substring(style.IndexOf("margin-bottom") + 14);
            style = style.Substring(style.IndexOf(";") + 2);
            newStyle += style + "; ";
            newStyle += "margin-bottom:" + value.ToString() + "px;";
            div.Attributes.Add("style", newStyle);
        }
    }

    protected void btnToProfile_Click(object sender, EventArgs e)
    {
        Session["ClickedWorkerID"] = WorkerID;
        Server.Transfer(TargetURL);
    }

}