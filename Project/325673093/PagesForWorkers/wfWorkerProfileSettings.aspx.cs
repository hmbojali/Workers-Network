using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Linq.Expressions;
using System.Web.UI.HtmlControls;
using System.IO;

public partial class PagesForWorkers_wfWorkerProfileSettings : System.Web.UI.Page
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
        string id = Session["ID"].ToString();
        if (!IsPostBack)
        {
            Worker worker = new Worker();
            WorkerDetails details = worker.GetWorkerByID(id);
            WorkerAttributes workerAttributes = new WorkerAttributes();
            WorkerAttributesDetails detailsAttributes = workerAttributes.GetWorkerAttributesByID(id);

            txtbxUsername.Text = details.UserName;
            txtbxName.Text = details.FirstName + " " + details.LastName;

            ddlStatus.SelectedItem.Selected = false;
            foreach (ListItem item in ddlStatus.Items)
            {
                if (item.Text == details.Status)
                    item.Selected = true;
            }

            txtbxProfession.Text = details.Profession;

            txtbxBirthDate.Text = DateToString(details.DateOfBirth);


            imgPFP.ImageUrl = details.ImageURL;
            txtbxBiographContent.Text = details.Biograph;
            txtbxPhoneNumber.Text = details.PhoneNumber;
            txtbxAvgPayment.Text = "" + detailsAttributes.AvgPayment;
            txtbxAvgHours.Text = "" + detailsAttributes.AvgHours;
            txtbxTags.Text = detailsAttributes.Tags;
            lblTimesOrdered.Text = "(" + detailsAttributes.TimesOrdered + ") Orders";
            txtbxExperienceYears.Text = detailsAttributes.ExperienceYears + "";

            int temp; double rating;
            temp = (int)(detailsAttributes.RatingQuality * 10);
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

    protected void btnSumbit_Click(object sender, EventArgs e)
    {
        lblErrorMessage.Visible = false;


        txtbxBirthDate.BorderColor = System.Drawing.Color.FromArgb(255, 153, 34);
        txtbxAvgHours.BorderColor = System.Drawing.Color.FromArgb(255, 153, 34);
        txtbxAvgPayment.BorderColor = System.Drawing.Color.FromArgb(255, 153, 34);
        txtbxExperienceYears.BorderColor = System.Drawing.Color.FromArgb(255, 153, 34);

        string id = Session["ID"].ToString();
        Worker worker = new Worker();
        WorkerDetails details = worker.GetWorkerByID(id);
        WorkerAttributes workerAttributes = new WorkerAttributes();
        WorkerAttributesDetails detailsAttributes = workerAttributes.GetWorkerAttributesByID(id);

        bool ValidData = true;

        details.UserName = txtbxUsername.Text;
        details.Profession = txtbxProfession.Text;
        details.Status = ddlStatus.SelectedValue;
        details.PhoneNumber = txtbxPhoneNumber.Text;
        details.FirstName = txtbxName.Text.Substring(0, txtbxName.Text.IndexOf(" "));
        details.LastName = txtbxName.Text.Substring(txtbxName.Text.IndexOf(" ") + 1);


        if (txtbxUsername.Text != "")
        {
            if (txtbxPhoneNumber.Text != "")
            {
                if(txtbxTags.Text!="")
                {
                    if (txtbxName.Text != "")
                    {
                        if (txtbxName.Text.Substring(0, txtbxName.Text.IndexOf(" ")) != "")
                        {
                            if (txtbxName.Text.Substring(txtbxName.Text.IndexOf(" ") + 1) != "")
                            {
                                ValidData = true; //all textboxes are filled with something other than the birthday. data is valid temporarily
                                details.UserName = txtbxUsername.Text;
                                details.PhoneNumber = txtbxPhoneNumber.Text;
                                details.FirstName = txtbxName.Text.Substring(0, txtbxName.Text.IndexOf(" "));
                                details.LastName = txtbxName.Text.Substring(txtbxName.Text.IndexOf(" ") + 1);
                                detailsAttributes.Tags = txtbxTags.Text;

                                string fn = details.ImageURL, saveLocation = "";
                                if (inputUploadImage.PostedFile.ContentLength != 0 &&
                                    inputUploadImage.PostedFile != null)
                                {
                                    try
                                    {
                                        fn = Path.GetFileName(inputUploadImage.PostedFile.FileName);
                                        saveLocation = Server.MapPath("~/Images/PFPs/") + fn;
                                        inputUploadImage.PostedFile.SaveAs(saveLocation);
                                        imgPFP.ImageUrl = "~/Images/PFPs/" + fn;
                                    }
                                    catch (Exception ex)
                                    {
                                        lblErrorMessage.Text = "Error : " + ex.Message;
                                    }
                                }
                                details.ImageURL = "~/Images/PFPs/" + fn;
                            }
                        }
                    }
                }
            }
        }


        string[] lines = txtbxBiographContent.Text.Split(new Char[] { '\n' }, StringSplitOptions.RemoveEmptyEntries);
        if (lines.Length > 9)
        {
            ValidData = false;
            lblErrorMessage.Text = "You Can Only Enter 9 Rows In Your Bio";
            lblErrorMessage.Visible = true;
        }
        else
        {
            lblErrorMessage.Text = "did";
            details.Biograph = txtbxBiographContent.Text;
        }

        try
        {
            details.DateOfBirth = StringToDate(txtbxBirthDate.Text);
        }
        catch
        {
            ValidData = false;
            lblErrorMessage.Text = "Please Enter A Proper Date Value In \"Birth date\"";
            lblErrorMessage.Visible = true;
            txtbxBirthDate.BorderColor = System.Drawing.Color.Red;
        }

        try
        {
            detailsAttributes.ExperienceYears = double.Parse(txtbxExperienceYears.Text);
        }
        catch
        {
            ValidData = false;
            lblErrorMessage.Text = "Please Enter Only Numric Values In \"Experience years\"";
            lblErrorMessage.Visible = true;
            txtbxExperienceYears.BorderColor = System.Drawing.Color.Red;
        }
        try
        {
            detailsAttributes.AvgPayment = double.Parse(txtbxAvgPayment.Text);
        }
        catch
        {
            ValidData = false;
            lblErrorMessage.Text = "Please Enter Only Numric Values In \"Average payment\"";
            lblErrorMessage.Visible = true;
            txtbxAvgPayment.BorderColor = System.Drawing.Color.Red;
        }
        try
        {
            detailsAttributes.AvgHours = double.Parse(txtbxAvgHours.Text);
        }
        catch
        {
            ValidData = false;
            lblErrorMessage.Text = "Please Enter Only Numric Values In \"Average work time\"";
            lblErrorMessage.Visible = true;
            txtbxAvgHours.BorderColor = System.Drawing.Color.Red;
        }

        if (ValidData)
        {
            worker.UpdateAllPublicDetails(details);
            workerAttributes.UpdateAllAttributes(detailsAttributes);
        }
        else if(lblErrorMessage.Visible==false)
        {
            lblErrorMessage.Text = "Some Values Are Missing!";
            lblErrorMessage.Visible = true;
        }

    }

    protected void btnAccountSettings_Click(object sender, EventArgs e)
    {
        Response.Redirect("~/PagesForWorkers/wfWorkerAccountSettings.aspx");
    }
}