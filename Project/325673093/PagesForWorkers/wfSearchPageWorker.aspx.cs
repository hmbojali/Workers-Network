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

public partial class PagesForWorkers_wfSearchPageWorker : System.Web.UI.Page
{
    public static int RoundUp(double val)//rounds the double value up, so 3.2 -> 4 ...
    {

        int result = (int)val;
        if ((val != (int)val))
            result++;

        return result;
    }
    protected void Page_Load(object sender, EventArgs e)
    {
        Node<string> searchTags, p;
        try
        {
            if (this.Page.PreviousPage != null)
            {
                //--------------starts recieving search data from prev page--------------

                string str = Session["Search"].ToString();

                //copy into here

                //starts making the text into hashtags
                if (str.Contains(" "))
                {
                    searchTags = new Node<string>("#" + str.Substring(0, str.IndexOf(" ")));
                    p = searchTags;
                    str = str.Substring(str.IndexOf(" ") + 1);
                    while (str != "")
                    {
                        if (str.Contains(" "))
                        {
                            p.SetNext(new Node<string>("#" + str.Substring(0, str.IndexOf(" "))));
                            str = str.Substring(str.IndexOf(" ") + 1);
                        }
                        else
                        {
                            p.SetNext(new Node<string>("#" + str));
                            str = "";
                        }
                        p = p.GetNext();
                    }
                }
                else
                    searchTags = new Node<string>("#" + str);
                //end of hashtags

                p = searchTags;

                //------------------end of recieving data-------------------
                //------------------start of getting workers with the tags-------------------

                WorkerAttributes workerAttributes = new WorkerAttributes();
                Node<WorkerAttributesDetails> all = workerAttributes.GetAllWorkerAttributes(); //contains all workerAttributes in data base
                Node<WorkerAttributesDetails> pAll = all; //pointer to 'all'
                Node<WorkerAttributesDetails> results = null, //is a place to store the workerAttributes resulted from the search
                    pResults = null; //pointer to 'results'
                int resultsNum = 0;



                //first search prosses, here I store the first result
                while (p != null) //goint through all the search tags
                {
                    while (pAll != null)//going through all the workerAttributes
                    {
                        Node<string> workerTags = workerAttributes.GetTags(pAll.GetValue().Tags);
                        while (workerTags != null) //goint through all the tags from the selected one workerAttributes
                        {
                            if (workerTags.GetValue() == p.GetValue())
                            {
                                results = new Node<WorkerAttributesDetails>(pAll.GetValue());
                                pResults = results;
                                resultsNum++;
                                pAll = pAll.GetNext();//just to check out the first worker
                                goto FoundFirstResult; //to the next stage
                            }
                            workerTags = workerTags.GetNext();
                        }
                        pAll = pAll.GetNext();
                    }
                    p = p.GetNext();
                }

            //here I store all the other results
            FoundFirstResult:
                while (p != null)
                {
                    while (pAll != null)
                    {
                        Node<string> workerTags = workerAttributes.GetTags(pAll.GetValue().Tags);
                        while (workerTags != null)
                        {
                            if (workerTags.GetValue() == p.GetValue())
                            {
                                pResults.SetNext(new Node<WorkerAttributesDetails>(pAll.GetValue()));
                                pResults = pResults.GetNext();
                                resultsNum++;
                                workerTags = null;
                            }
                            else
                                workerTags = workerTags.GetNext();
                        }
                        //FoundResult:
                        pAll = pAll.GetNext();
                    }
                    p = p.GetNext();
                }
                pResults = results;

                //------------------end of getting workers with the tags-------------------
                //-----------------start of veiwing workers with the tags------------------

                int index = 0;
                wucWorkerProfileInSearch[] target = new wucWorkerProfileInSearch[resultsNum];

                //here starts adding result buttons of workers profiles
                //demonstration of the design:
                /*
                 * [profile] [profile] [profile]
                 * [profile] [profile] [profile] 
                 * [profile] .....
                 */

                for (int i = 0; i < (RoundUp((double)resultsNum / 3)); i++)
                {
                    //posLeft = 0;
                    for (int j = 0; j < 3 && index != resultsNum; j++)
                    {
                        Worker worker = new Worker();

                        //makes the target control in the page
                        target[index] = (wucWorkerProfileInSearch)Page.LoadControl("~/UserControls/wucWorkerProfileInSearch.ascx");


                        target[index].ID = "profile" + (index + 1);

                        //here i take the id out of the workerAttributes and then get the needed profile properties from the tblWorkers

                        target[index].PFP.ImageUrl = worker.GetWorkerByID(pResults.GetValue().WorkerID).ImageURL;
                        target[index].Username.Text = worker.GetWorkerByID(pResults.GetValue().WorkerID).UserName;
                        target[index].Name.Text = worker.GetWorkerByID(pResults.GetValue().WorkerID).FirstName + " " + worker.GetWorkerByID(pResults.GetValue().WorkerID).LastName;
                        target[index].Profession.Text = worker.GetWorkerByID(pResults.GetValue().WorkerID).Profession;
                        target[index].Status.Text = "(" + worker.GetWorkerByID(pResults.GetValue().WorkerID).Status + ")";

                        double rating = (
                                workerAttributes.GetWorkerAttributesByID(pResults.GetValue().WorkerID).RatingComfort +
                                workerAttributes.GetWorkerAttributesByID(pResults.GetValue().WorkerID).RatingQuality +
                                workerAttributes.GetWorkerAttributesByID(pResults.GetValue().WorkerID).RatingSpeed
                                ) / 3.0;



                        int temp = (int)(rating * 10);
                        rating = temp / 10.0;
                        target[index].Rating.Text = rating + "&#10029;";

                        target[index].TimesRated.Text = "(" + workerAttributes.GetWorkerAttributesByID(pResults.GetValue().WorkerID).TimesRated + ")";
                        target[index].MarginBottom = 10;
                        target[index].WorkerID = pResults.GetValue().WorkerID;
                        target[index].TargetURL = "~/PagesForWorkers/wfWorkersProfileWorker.aspx";

                        target[index].Visible = true;

                        //here I get the div that i want to insert the target into and do so
                        HtmlControl div = (HtmlControl)divs.FindControl("div" + (j + 1));
                        div.Controls.Add(target[index]);

                        pResults = pResults.GetNext();
                        index++;
                    }
                }

                //end copy
            }
            else
            {
                string str = Session["Search"].ToString();

                //copy into here

                //starts making the text into hashtags
                if (str.Contains(" "))
                {
                    searchTags = new Node<string>("#" + str.Substring(0, str.IndexOf(" ")));
                    p = searchTags;
                    str = str.Substring(str.IndexOf(" ") + 1);
                    while (str != "")
                    {
                        if (str.Contains(" "))
                        {
                            p.SetNext(new Node<string>("#" + str.Substring(0, str.IndexOf(" "))));
                            str = str.Substring(str.IndexOf(" ") + 1);
                        }
                        else
                        {
                            p.SetNext(new Node<string>("#" + str));
                            str = "";
                        }
                        p = p.GetNext();
                    }
                }
                else
                    searchTags = new Node<string>("#" + str);
                //end of hashtags

                p = searchTags;

                //------------------end of recieving data-------------------
                //------------------start of getting workers with the tags-------------------

                WorkerAttributes workerAttributes = new WorkerAttributes();
                Node<WorkerAttributesDetails> all = workerAttributes.GetAllWorkerAttributes(); //contains all workerAttributes in data base
                Node<WorkerAttributesDetails> pAll = all; //pointer to 'all'
                Node<WorkerAttributesDetails> results = null, //is a place to store the workerAttributes resulted from the search
                    pResults = null; //pointer to 'results'
                int resultsNum = 0;



                //first search prosses, here I store the first result
                while (p != null) //goint through all the search tags
                {
                    while (pAll != null)//going through all the workerAttributes
                    {
                        Node<string> workerTags = workerAttributes.GetTags(pAll.GetValue().Tags);
                        while (workerTags != null) //goint through all the tags from the selected one workerAttributes
                        {
                            if (workerTags.GetValue() == p.GetValue())
                            {
                                results = new Node<WorkerAttributesDetails>(pAll.GetValue());
                                pResults = results;
                                resultsNum++;
                                pAll = pAll.GetNext();//just to check out the first worker
                                goto FoundFirstResult; //to the next stage
                            }
                            workerTags = workerTags.GetNext();
                        }
                        pAll = pAll.GetNext();
                    }
                    p = p.GetNext();
                }

            //here I store all the other results
            FoundFirstResult:
                while (p != null)
                {
                    while (pAll != null)
                    {
                        Node<string> workerTags = workerAttributes.GetTags(pAll.GetValue().Tags);
                        while (workerTags != null)
                        {
                            if (workerTags.GetValue() == p.GetValue())
                            {
                                pResults.SetNext(new Node<WorkerAttributesDetails>(pAll.GetValue()));
                                pResults = pResults.GetNext();
                                resultsNum++;
                                workerTags = null;
                            }
                            else
                                workerTags = workerTags.GetNext();
                        }
                        //FoundResult:
                        pAll = pAll.GetNext();
                    }
                    p = p.GetNext();
                }
                pResults = results;

                //------------------end of getting workers with the tags-------------------
                //-----------------start of veiwing workers with the tags------------------

                int index = 0;
                wucWorkerProfileInSearch[] target = new wucWorkerProfileInSearch[resultsNum];

                //here starts adding result buttons of workers profiles
                //demonstration of the design:
                /*
                 * [profile] [profile] [profile]
                 * [profile] [profile] [profile] 
                 * [profile] .....
                 */

                for (int i = 0; i < (RoundUp((double)resultsNum / 3)); i++)
                {
                    //posLeft = 0;
                    for (int j = 0; j < 3 && index != resultsNum; j++)
                    {
                        Worker worker = new Worker();

                        //makes the target control in the page
                        target[index] = (wucWorkerProfileInSearch)Page.LoadControl("~/UserControls/wucWorkerProfileInSearch.ascx");


                        target[index].ID = "profile" + (index + 1);

                        //here i take the id out of the workerAttributes and then get the needed profile properties from the tblWorkers

                        target[index].PFP.ImageUrl = worker.GetWorkerByID(pResults.GetValue().WorkerID).ImageURL;
                        target[index].Username.Text = worker.GetWorkerByID(pResults.GetValue().WorkerID).UserName;
                        target[index].Name.Text = worker.GetWorkerByID(pResults.GetValue().WorkerID).FirstName + " " + worker.GetWorkerByID(pResults.GetValue().WorkerID).LastName;
                        target[index].Profession.Text = worker.GetWorkerByID(pResults.GetValue().WorkerID).Profession;
                        target[index].Status.Text = "(" + worker.GetWorkerByID(pResults.GetValue().WorkerID).Status + ")";

                        double rating = (
                                workerAttributes.GetWorkerAttributesByID(pResults.GetValue().WorkerID).RatingComfort +
                                workerAttributes.GetWorkerAttributesByID(pResults.GetValue().WorkerID).RatingQuality +
                                workerAttributes.GetWorkerAttributesByID(pResults.GetValue().WorkerID).RatingSpeed
                                ) / 3.0;



                        int temp = (int)(rating * 10);
                        rating = temp / 10.0;
                        target[index].Rating.Text = rating + "&#10029;";

                        target[index].TimesRated.Text = "(" + workerAttributes.GetWorkerAttributesByID(pResults.GetValue().WorkerID).TimesRated + ")";
                        target[index].MarginBottom = 10;
                        target[index].WorkerID = pResults.GetValue().WorkerID;
                        target[index].TargetURL = "~/PagesForWorkers/wfWorkersProfileWorker.aspx";

                        target[index].Visible = true;

                        //here I get the div that i want to insert the target into and do so
                        HtmlControl div = (HtmlControl)divs.FindControl("div" + (j + 1));
                        div.Controls.Add(target[index]);

                        pResults = pResults.GetNext();
                        index++;
                    }
                }

                //end copy
            }
        }
        catch (Exception ex)
        {

        }
        // Label1.Text = Page.ClientID;

    }
}