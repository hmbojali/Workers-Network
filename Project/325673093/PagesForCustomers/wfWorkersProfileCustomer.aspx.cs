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

public partial class PagesForCustomers_wfWorkersProfileCustomer : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {


        if (this.Page.PreviousPage != null)
        {

            string target = "";

            //depricated, not deleting it because it used to work and it took me 1 whole week and its a masterpiece
            //-----------------start to get the pressed worker profile--------------
            //    int targetIndex;
            //    ControlCollection controls = this.Page.PreviousPage.Controls;
            //    Control form = new Control();

            //    //--------------getting the form of the previous page----------------
            //    form = this.Page.PreviousPage.FindControl("form1");

            //    for (int i = 1; i < 4; i++)
            //    {

            //        HtmlControl divs = (HtmlControl)form.FindControl("divs");
            //        HtmlControl div = (HtmlControl)divs.FindControl("div" + i);
            //        div.Controls.Remove(div.Controls[0]);//removing an empty control

            //        while (div.Controls.Count != 0)
            //        {
            //            wucWorkerProfileInSearch profile = (wucWorkerProfileInSearch)div.Controls[0];
            //            if (profile.Username.ID.Contains("target"))//finding the wanted worker profile control
            //            {
            //                target = profile.WorkerID;
            //                goto FoundTarget; //breaking out of the loops
            //            }
            //            else
            //                div.Controls.Remove(div.Controls[0]);
            //        }
            //    }
            //FoundTarget:

            //----------------------------END--------------------------

            target = Session["ClickedWorkerID"].ToString();

            Worker worker = new Worker();
            WorkerDetails details = worker.GetWorkerByID(target);
            WorkerAttributes workerAttributes = new WorkerAttributes();
            WorkerAttributesDetails detailsAttributes = workerAttributes.GetWorkerAttributesByID(target);

            lblUsername.Text = details.UserName;
            lblName.Text = details.FirstName + " " + details.LastName;

            lblStatus.Text = "(" + details.Status + ")";
            if (details.Status == "Free")
                lblStatus.ForeColor = System.Drawing.Color.FromArgb(0, 153, 0);
            else if (details.Status == "Not Busy")
                lblStatus.ForeColor = System.Drawing.Color.FromArgb(234, 180, 0);
            else if (details.Status == "Busy")
                lblStatus.ForeColor = System.Drawing.Color.FromArgb(255, 51, 0);
            else if (details.Status == "Very Busy")
                lblStatus.ForeColor = System.Drawing.Color.FromArgb(234, 0, 0);
            else if (details.Status == "Unavailable")
                lblStatus.ForeColor = System.Drawing.Color.DarkGray;


            lblProfession.Text = details.Profession;

            //making the age only have one decimel
            int t = (int)((DateTime.Now - details.DateOfBirth).TotalDays * 10 / 365);
            lblAge.Text = t / 10.0 + " years old";


            imgPFP.ImageUrl=details.ImageURL;
            txtbxBiographContent.Text = details.Biograph;
            lblPhoneNumber.Text = details.PhoneNumber;
            lblEmail.Text += details.Email;
            lblAvgPayment.Text += detailsAttributes.AvgPayment + "&#8362;/h";
            lblAvgHours.Text += detailsAttributes.AvgHours + "h";
            lblTimesOrdered.Text = "(" + detailsAttributes.TimesOrdered + ") Orders";
            lblExperienceYears.Text = detailsAttributes.ExperienceYears + " Experience years";

            int temp; double rating;
            temp = (int)(detailsAttributes.RatingQuality*10);
            rating = temp / 10.0;
            lblRatingQuality.Text = "Quality " + rating + "&#10029;";
            temp = (int)(detailsAttributes.RatingSpeed * 10);
            rating = temp / 10.0;
            lblRatingSpeed.Text = "Speed " + rating + "&#10029;";
            temp = (int)(detailsAttributes.RatingComfort * 10);
            rating = temp / 10.0;
            lblRatingComfort.Text = "Comfort " + rating + "&#10029;";


            lblTimesRated.Text = "(" + detailsAttributes.TimesRated + ") Ratings";
        }
    }

    protected void btnSumbitOrder_Click(object sender, EventArgs e)
    {
        btnCancel.Visible = true;
        btnConfirm.Visible = true;
        btnSumbitOrder.Visible = false;
    }

    protected void btnCancel_Click(object sender, ImageClickEventArgs e)
    {
        btnCancel.Visible = false;
        btnConfirm.Visible = false;
        btnSumbitOrder.Visible = true;
    }

    protected void btnConfirm_Click(object sender, ImageClickEventArgs e)
    {
        string email;
        email = lblEmail.Text.Substring(15);
        Worker worker = new Worker();
        Order order = new Order();
        OrderDetails details = new OrderDetails();
        details.CustomerID = Session["ID"].ToString();
        details.WorkerID = (worker.GetWorkerByEmail(email)).WorkerID;
        details.Title = txtbxOrderTitle.Text;
        details.Description = txtbxOrderDescription.Text;
        order.AddOrder(details);
        btnCancel.Visible = false;
        btnConfirm.Visible = false;
        btnSumbitOrder.Visible = true;
        txtbxOrderTitle.Text = "";
        txtbxOrderDescription.Text = "";
    }

    protected void btnSubmitRating_Click(object sender, EventArgs e)
    {
        string email;
        email = lblEmail.Text.Substring(15);

        Worker worker = new Worker();
        WorkerAttributes workerAttributes = new WorkerAttributes();

        string id= worker.GetWorkerByEmail(email).WorkerID;

        workerAttributes.AddRating(id,
            int.Parse(ddlRatingQuality.SelectedValue),
            int.Parse(ddlRatingSpeed.SelectedValue),
            int.Parse(ddlRatingComfort.SelectedValue));
    }
}