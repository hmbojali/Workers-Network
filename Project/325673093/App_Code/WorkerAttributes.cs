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
using System.Collections.Generic;
using System.Web.Services;
/// <summary>
/// Summary description for Customer
/// </summary>

//**************Class  WorkerAttributesDetails - begin ***************
public class WorkerAttributesDetails
{
    private string _WorkerID;
    private double _AvgPayment;
    private double _AvgHours;
    private int _TimesOrdered;
    private double _ExperienceYears;
    private double _RatingQuality;
    private double _RatingSpeed;
    private double _RatingComfort;
    private int _TimesRated;
    private string _Tags;


    //Properties
    public string WorkerID
    {
        get { return _WorkerID; }
        set { _WorkerID = value; }
    }
    public double AvgPayment
    {
        get { return _AvgPayment; }
        set { _AvgPayment = value; }
    }
    public double AvgHours
    {
        get { return _AvgHours; }
        set { _AvgHours = value; }
    }
    public int TimesOrdered
    {
        get { return _TimesOrdered; }
        set { _TimesOrdered = value; }
    }
    public double ExperienceYears
    {
        get { return _ExperienceYears; }
        set { _ExperienceYears = value; }
    }
    public double RatingQuality
    {
        get { return _RatingQuality; }
        set { _RatingQuality = value; }
    }
    public double RatingSpeed
    {
        get { return _RatingSpeed; }
        set { _RatingSpeed = value; }
    }
    public double RatingComfort
    {
        get { return _RatingComfort; }
        set { _RatingComfort = value; }
    }
    public int TimesRated
    {
        get { return _TimesRated; }
        set { _TimesRated = value; }
    }
    public string Tags
    {
        get { return _Tags; }
        set { _Tags = value; }
    }


}
//**************Class  WorkerAttributesDetails - end ***************
//**************Class  WorkerAttributes - begin ********************
public class WorkerAttributes
{
    //Encapsulation
    ArrayList prmList;
    OleDbParameter prm;
    string strSQLName;

    //Constructor
    public WorkerAttributes()
    {
    }
    //Methods

    //___________________AddWorkerAttributes_______________________

    public void AddWorkerAttributes(WorkerAttributesDetails wrkrAtrDetails)
    {
        strSQLName = "spAddWorkerAttributes";
        prmList = new ArrayList();

        prm = new OleDbParameter("@WorkerID", OleDbType.VarChar);
        prm.Value = wrkrAtrDetails.WorkerID;
        prmList.Add(prm);

        prm = new OleDbParameter("@Tags", OleDbType.VarChar);
        prm.Value = wrkrAtrDetails.Tags;
        prmList.Add(prm);

        DoQueries.ExecuteSPNonQuery(strSQLName, prmList);
    }


    [WebMethod]
    public WorkerAttributesDetails GetWorkerAttributesByID(string id)
    {
        WorkerAttributesDetails e = new WorkerAttributesDetails();

        string strDetails =
            string.Format("SELECT * FROM tblWorkerAttributes" +
            " WHERE workerID='{0}'", id);
        DataSet ds = DoQueries.ExecuteDataSet(strDetails);
        e.WorkerID = ds.Tables[0].Rows[0]["workerID"].ToString();
        e.AvgPayment = double.Parse(ds.Tables[0].Rows[0]["avgPayment"].ToString());
        e.AvgHours = double.Parse(ds.Tables[0].Rows[0]["avgHours"].ToString());
        e.TimesOrdered = int.Parse(ds.Tables[0].Rows[0]["timesOrdered"].ToString());
        e.ExperienceYears = double.Parse(ds.Tables[0].Rows[0]["experienceYears"].ToString());
        e.RatingQuality = double.Parse(ds.Tables[0].Rows[0]["ratingQuality"].ToString());
        e.RatingSpeed = double.Parse(ds.Tables[0].Rows[0]["ratingSpeed"].ToString());
        e.RatingComfort = double.Parse(ds.Tables[0].Rows[0]["ratingComfort"].ToString());
        e.TimesRated = int.Parse(ds.Tables[0].Rows[0]["timesRated"].ToString());
        e.Tags = ds.Tables[0].Rows[0]["tags"].ToString();

        return e;
    }


    [WebMethod]
    public Node<WorkerAttributesDetails> GetAllWorkerAttributes()
    {
        Node<WorkerAttributesDetails> all, temp;
        WorkerAttributesDetails e = new WorkerAttributesDetails();

        string strDetails =
               string.Format("SELECT * FROM tblWorkerAttributes");
        DataSet ds = DoQueries.ExecuteDataSet(strDetails);
        e.WorkerID = ds.Tables[0].Rows[0]["workerID"].ToString();
        e.AvgPayment = double.Parse(ds.Tables[0].Rows[0]["avgPayment"].ToString());
        e.AvgHours = double.Parse(ds.Tables[0].Rows[0]["avgHours"].ToString());
        e.TimesOrdered = int.Parse(ds.Tables[0].Rows[0]["timesOrdered"].ToString());
        e.ExperienceYears = double.Parse(ds.Tables[0].Rows[0]["experienceYears"].ToString());
        e.RatingQuality = double.Parse(ds.Tables[0].Rows[0]["ratingQuality"].ToString());
        e.RatingSpeed = double.Parse(ds.Tables[0].Rows[0]["ratingSpeed"].ToString());
        e.RatingComfort = double.Parse(ds.Tables[0].Rows[0]["ratingComfort"].ToString());
        e.TimesRated = int.Parse(ds.Tables[0].Rows[0]["timesRated"].ToString());
        e.Tags = ds.Tables[0].Rows[0]["tags"].ToString();

        all = new Node<WorkerAttributesDetails>(e);
        temp = all;
        int count = (int)DoQueries.ExecuteSPScalar("spWorkerAttributesCount");

        for (int i = 1; i < count; i++)
        {
            e = new WorkerAttributesDetails();
            e.WorkerID = ds.Tables[0].Rows[i]["workerID"].ToString();
            e.AvgPayment = double.Parse(ds.Tables[0].Rows[i]["avgPayment"].ToString());
            e.AvgHours = double.Parse(ds.Tables[0].Rows[i]["avgHours"].ToString());
            e.TimesOrdered = int.Parse(ds.Tables[0].Rows[i]["timesOrdered"].ToString());
            e.ExperienceYears = int.Parse(ds.Tables[0].Rows[i]["experienceYears"].ToString());
            e.RatingQuality = double.Parse(ds.Tables[0].Rows[i]["ratingQuality"].ToString());
            e.RatingSpeed = double.Parse(ds.Tables[0].Rows[i]["ratingSpeed"].ToString());
            e.RatingComfort = double.Parse(ds.Tables[0].Rows[i]["ratingComfort"].ToString());
            e.TimesRated = int.Parse(ds.Tables[0].Rows[i]["timesRated"].ToString());
            e.Tags = ds.Tables[0].Rows[i]["tags"].ToString();

            temp.SetNext(new Node<WorkerAttributesDetails>(e));
            temp = temp.GetNext();
        }


        return all;
    }

    public Node<string> GetTags(string str)
    {
        Node<string> result, p;

        //starts splitting the tags into nodes

        str = str.Substring(1);
        if (str.Contains("#"))
        {
            result = new Node<string>("#" + str.Substring(0, str.IndexOf("#")));
            p = result;
            str = str.Substring(str.IndexOf("#") + 1);
            while (str != "")
            {
                if (str.Contains("#"))
                {
                    p.SetNext(new Node<string>("#" + str.Substring(0, str.IndexOf("#"))));
                    str = str.Substring(str.IndexOf("#") + 1);
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
            result = new Node<string>("#" + str);
        return result;
    }

    //___________________AddRating-Update_______________________
    public void AddRating(string id, double ratingQuality, double ratingSpeed, double ratingComfort)
    {
        WorkerAttributes workerAttributes = new WorkerAttributes();
        WorkerAttributesDetails e = workerAttributes.GetWorkerAttributesByID(id);

        e.TimesRated++;
        ratingQuality = (e.RatingQuality * e.TimesRated + ratingQuality) / (e.TimesRated);
        ratingSpeed = (e.RatingSpeed * e.TimesRated + ratingSpeed) / (e.TimesRated);
        ratingComfort = (e.RatingComfort * e.TimesRated + ratingComfort) / (e.TimesRated);

        strSQLName = "spAddRating";
        prmList = new ArrayList();

        prm = new OleDbParameter("@RatingQuality", OleDbType.VarChar);
        prm.Value = ratingQuality;
        prmList.Add(prm);

        prm = new OleDbParameter("@RatingSpeed", OleDbType.VarChar);
        prm.Value = ratingSpeed;
        prmList.Add(prm);

        prm = new OleDbParameter("@RatingComfort", OleDbType.VarChar);
        prm.Value = ratingComfort;
        prmList.Add(prm);

        prm = new OleDbParameter("@TimesRated", OleDbType.VarChar);
        prm.Value = e.TimesRated;
        prmList.Add(prm);

        prm = new OleDbParameter("@ID", OleDbType.VarChar);
        prm.Value = id;
        prmList.Add(prm);

        DoQueries.ExecuteSPNonQuery(strSQLName, prmList);
    }
    //___________________Update worker attributes-Update_______________________    
    public void UpdateAllAttributes(WorkerAttributesDetails e)
    {
        strSQLName = "spUpdateWorkerAttributes";
        prmList = new ArrayList();

        prm = new OleDbParameter("@AvgPayment", OleDbType.VarChar);
        prm.Value = e.AvgPayment;
        prmList.Add(prm);

        prm = new OleDbParameter("@AvgHours", OleDbType.VarChar);
        prm.Value = e.AvgHours;
        prmList.Add(prm);

        prm = new OleDbParameter("@ExperienceYears", OleDbType.VarChar);
        prm.Value = e.ExperienceYears;
        prmList.Add(prm);

        prm = new OleDbParameter("@Tags", OleDbType.VarChar);
        prm.Value = e.Tags;
        prmList.Add(prm);

        prm = new OleDbParameter("@TimesOrdered", OleDbType.VarChar);
        prm.Value = e.TimesOrdered;
        prmList.Add(prm);

        prm = new OleDbParameter("@ID", OleDbType.VarChar);
        prm.Value = e.WorkerID;
        prmList.Add(prm);

        DoQueries.ExecuteSPNonQuery(strSQLName, prmList);
    }
    public void IncreaseTimesOrdered(string id)
    {
        WorkerAttributes worker = new WorkerAttributes();
        int Times=worker.GetWorkerAttributesByID(id).TimesOrdered+1;
            string strSQL = "UPDATE tblWorkerAttributes SET " +
            "timesOrdered= " + Times +" " +
            "WHERE workerID =\"" + id + "\";";
        DataTable dt = DoQueries.ExecuteDataTable(strSQL);//useless
    }

}
//**************Class  WorkerAttributes - end **********************