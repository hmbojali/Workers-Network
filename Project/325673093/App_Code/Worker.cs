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
/// Summary description for Worker
/// </summary>

//**************Class  WorkerDetails - begin ***************
public class WorkerDetails
{
    private string _WorkerID;
    private string _FirstName;
    private string _LastName;
    private DateTime _DateOfBirth;
    private string _PhoneNumber;
    private string _Email;
    private string _UserName;
    private string _Password;
    private string _Profession;
    private string _ImageURL;
    private string _Biograph;
    private string _Status;


    //Properties
    public string WorkerID
    {
        get { return _WorkerID; }
        set { _WorkerID = value; }
    }
    public string FirstName
    {
        get { return _FirstName; }
        set { _FirstName = value; }
    }
    public string LastName
    {
        get { return _LastName; }
        set { _LastName = value; }
    }
    public DateTime DateOfBirth
    {
        get { return _DateOfBirth; }
        set { _DateOfBirth = value; }
    }
    public string PhoneNumber
    {
        get { return _PhoneNumber; }
        set { _PhoneNumber = value; }
    }
    public string Email
    {
        get { return _Email; }
        set { _Email = value; }
    }
    public string UserName
    {
        get { return _UserName; }
        set { _UserName = value; }
    }
    public string Password
    {
        get { return _Password; }
        set { _Password = value; }
    }
    public string Profession
    {
        get { return _Profession; }
        set { _Profession = value; }
    }
    public string ImageURL
    {
        get { return _ImageURL; }
        set { _ImageURL = value; }
    }
    public string Biograph
    {
        get { return _Biograph; }
        set { _Biograph = value; }
    }
    public string Status
    {
        get { return _Status; }
        set { _Status = value; }
    }


}
//**************Class  WorkerDetails - end ***************
//**************Class  Worker - begin ********************
public class Worker
{
    //Encapsulation
    ArrayList prmList;
    OleDbParameter prm;
    string strSQLName;

    //Constructor
    public Worker()
    {
    }
    //Methods

    //___________________AddWorker_______________________

    public void AddWorker(WorkerDetails wrkrDetails)
    {
        strSQLName = "spAddWorker";
        prmList = new ArrayList();

        prm = new OleDbParameter("@WorkerID", OleDbType.VarChar);
        prm.Value = wrkrDetails.WorkerID;
        prmList.Add(prm);

        prm = new OleDbParameter("@FirstName", OleDbType.VarChar);
        prm.Value = wrkrDetails.FirstName;
        prmList.Add(prm);

        prm = new OleDbParameter("@LastName", OleDbType.VarChar);
        prm.Value = wrkrDetails.LastName;
        prmList.Add(prm);

        prm = new OleDbParameter("@DateOfBirth", OleDbType.VarChar);
        prm.Value = wrkrDetails.DateOfBirth;
        prmList.Add(prm);

        prm = new OleDbParameter("@PhoneNumber", OleDbType.VarChar);
        prm.Value = wrkrDetails.PhoneNumber;
        prmList.Add(prm);

        prm = new OleDbParameter("@Email", OleDbType.VarChar);
        prm.Value = wrkrDetails.Email;
        prmList.Add(prm);

        prm = new OleDbParameter("@UserName", OleDbType.VarChar);
        prm.Value = wrkrDetails.UserName;
        prmList.Add(prm);

        prm = new OleDbParameter("@Password", OleDbType.VarChar);
        prm.Value = wrkrDetails.Password;
        prmList.Add(prm);

        prm = new OleDbParameter("@Profession", OleDbType.VarChar);
        prm.Value = wrkrDetails.Profession;
        prmList.Add(prm);


        DoQueries.ExecuteSPNonQuery(strSQLName, prmList);
    }

    //___________________ExistWorker_________________________________
    public Boolean ExistWorker(string Email, bool useless)
    {
        strSQLName = "spExistWorker";
        prmList = new ArrayList();

        prm = new OleDbParameter("@Email", OleDbType.VarChar);
        prm.Value = Email;
        prmList.Add(prm);

        prm = new OleDbParameter("@WorkerID", OleDbType.VarChar);
        prm.Value = "a-1-8-8-8-7-9";
        prmList.Add(prm);

        int intCount = (int)DoQueries.ExecuteSPScalar(strSQLName, prmList);
        return intCount > 0;
    }
    public Boolean ExistWorker(string ID)
    {
        strSQLName = "spExistWorker";
        prmList = new ArrayList();

        prm = new OleDbParameter("@Email", OleDbType.VarChar);
        prm.Value = "a-1-8-8-8-7-9";
        prmList.Add(prm);

        prm = new OleDbParameter("@WorkerID", OleDbType.VarChar);
        prm.Value = ID;
        prmList.Add(prm);

        int intCount = (int)DoQueries.ExecuteSPScalar(strSQLName, prmList);
        return intCount > 0;
    }

    [WebMethod]
    public WorkerDetails GetWorkerByID(string id)
    {
        WorkerDetails e = new WorkerDetails();

        if (ExistWorker(id))
        {
            string strDetails =
                string.Format("SELECT * FROM tblWorkers" +
                " WHERE workerID='{0}'", id);
            DataSet ds = DoQueries.ExecuteDataSet(strDetails);
            e.WorkerID = ds.Tables[0].Rows[0]["workerID"].ToString();
            e.FirstName = ds.Tables[0].Rows[0]["firstName"].ToString();
            e.LastName = ds.Tables[0].Rows[0]["lastName"].ToString();
            {
                int day, month, year;
                DateTime date;
                string strDate = ds.Tables[0].Rows[0]["dateOfBirth"].ToString();


                day = int.Parse(strDate.Substring(0, strDate.IndexOf("/")));
                strDate = strDate.Substring(strDate.IndexOf("/") + 1);
                month = int.Parse(strDate.Substring(0, strDate.IndexOf("/")));
                strDate = strDate.Substring(strDate.IndexOf("/") + 1);
                year = int.Parse(strDate.Substring(0, strDate.IndexOf(" ")));

                date = new DateTime(year, month, day);

                e.DateOfBirth = date;
            }//getting the date
            e.PhoneNumber = ds.Tables[0].Rows[0]["phoneNumber"].ToString();
            e.Email = ds.Tables[0].Rows[0]["email"].ToString();
            e.UserName = ds.Tables[0].Rows[0]["userName"].ToString();
            e.Password = ds.Tables[0].Rows[0]["password"].ToString();
            e.Profession = ds.Tables[0].Rows[0]["profession"].ToString();
            e.ImageURL = ds.Tables[0].Rows[0]["imageURL"].ToString();
            e.Biograph = ds.Tables[0].Rows[0]["biograph"].ToString();
            e.Status = ds.Tables[0].Rows[0]["status"].ToString();
        }
        return e;
    }

    public WorkerDetails GetWorkerByEmail(string email)
    {
        WorkerDetails e = new WorkerDetails();

        if (ExistWorker(email, true))
        {
            string strDetails =
                string.Format("SELECT * FROM tblWorkers" +
                " WHERE email='{0}'", email);
            DataSet ds = DoQueries.ExecuteDataSet(strDetails);
            e.WorkerID = ds.Tables[0].Rows[0]["workerID"].ToString();
            e.FirstName = ds.Tables[0].Rows[0]["firstName"].ToString();
            e.LastName = ds.Tables[0].Rows[0]["lastName"].ToString();
            {
                int day, month, year;
                DateTime date;
                string strDate = ds.Tables[0].Rows[0]["dateOfBirth"].ToString();


                day = int.Parse(strDate.Substring(0, strDate.IndexOf("/")));
                strDate = strDate.Substring(strDate.IndexOf("/") + 1);
                month = int.Parse(strDate.Substring(0, strDate.IndexOf("/")));
                strDate = strDate.Substring(strDate.IndexOf("/") + 1);
                year = int.Parse(strDate.Substring(0, strDate.IndexOf(" ")));

                date = new DateTime(year, month, day);

                e.DateOfBirth = date;
            }//getting the date
            e.PhoneNumber = ds.Tables[0].Rows[0]["phoneNumber"].ToString();
            e.Email = email;
            e.UserName = ds.Tables[0].Rows[0]["userName"].ToString();
            e.Password = ds.Tables[0].Rows[0]["password"].ToString();
            e.Profession = ds.Tables[0].Rows[0]["profession"].ToString();
            e.ImageURL = ds.Tables[0].Rows[0]["imageURL"].ToString();
            e.Biograph = ds.Tables[0].Rows[0]["biograph"].ToString();
            e.Status = ds.Tables[0].Rows[0]["status"].ToString();
        }
        return e;
    }

    //___________________Update Worker-Update_______________________
    public void UpdateAllPublicDetails(WorkerDetails e)
    {

        strSQLName = "spUpdateWorkerPublicInfo";
        prmList = new ArrayList();


        prm = new OleDbParameter("@FirstName", OleDbType.VarChar);
        prm.Value = e.FirstName;
        prmList.Add(prm);

        prm = new OleDbParameter("@LastName", OleDbType.VarChar);
        prm.Value = e.LastName;
        prmList.Add(prm);

        prm = new OleDbParameter("@DateOfBirth", OleDbType.VarChar);
        prm.Value = e.DateOfBirth;
        prmList.Add(prm);

        prm = new OleDbParameter("@PhoneNumber", OleDbType.VarChar);
        prm.Value = e.PhoneNumber;
        prmList.Add(prm);

        prm = new OleDbParameter("@UserName", OleDbType.VarChar);
        prm.Value = e.UserName;
        prmList.Add(prm);

        prm = new OleDbParameter("@ImageURL", OleDbType.VarChar);
        prm.Value = e.ImageURL;
        prmList.Add(prm);

        prm = new OleDbParameter("@Biograph", OleDbType.VarChar);
        prm.Value = e.Biograph;
        prmList.Add(prm);

        prm = new OleDbParameter("@Status", OleDbType.VarChar);
        prm.Value = e.Status;
        prmList.Add(prm);

        prm = new OleDbParameter("@ID", OleDbType.VarChar);
        prm.Value = e.WorkerID;
        prmList.Add(prm);

        DoQueries.ExecuteSPNonQuery(strSQLName, prmList);
    }

    public void UpdateAllPrivateDetails(WorkerDetails e)
    {
        strSQLName = "spUpdateWorkerPrivateInfo";
        prmList = new ArrayList();

        prm = new OleDbParameter("@Email", OleDbType.VarChar);
        prm.Value = e.Email;
        prmList.Add(prm);

        prm = new OleDbParameter("@Password", OleDbType.VarChar);
        prm.Value = e.Password;
        prmList.Add(prm);

        prm = new OleDbParameter("@ID", OleDbType.VarChar);
        prm.Value = e.WorkerID;
        prmList.Add(prm);

        DoQueries.ExecuteSPNonQuery(strSQLName, prmList);
    }
    public void UpdateStatus(string id, string Status)
    {
        Worker worker = new Worker();
        WorkerDetails e = worker.GetWorkerByID(id);

        strSQLName = "spUpdateWorkerPublicInfo";
        prmList = new ArrayList();


        prm = new OleDbParameter("@FirstName", OleDbType.VarChar);
        prm.Value = e.FirstName;
        prmList.Add(prm);

        prm = new OleDbParameter("@LastName", OleDbType.VarChar);
        prm.Value = e.LastName;
        prmList.Add(prm);

        prm = new OleDbParameter("@DateOfBirth", OleDbType.VarChar);
        prm.Value = e.DateOfBirth;
        prmList.Add(prm);

        prm = new OleDbParameter("@PhoneNumber", OleDbType.VarChar);
        prm.Value = e.PhoneNumber;
        prmList.Add(prm);

        prm = new OleDbParameter("@UserName", OleDbType.VarChar);
        prm.Value = e.UserName;
        prmList.Add(prm);

        prm = new OleDbParameter("@ImageURL", OleDbType.VarChar);
        prm.Value = e.ImageURL;
        prmList.Add(prm);

        prm = new OleDbParameter("@Biograph", OleDbType.VarChar);
        prm.Value = e.Biograph;
        prmList.Add(prm);

        prm = new OleDbParameter("@Status", OleDbType.VarChar);
        prm.Value = Status;
        prmList.Add(prm);

        prm = new OleDbParameter("@ID", OleDbType.VarChar);
        prm.Value = id;
        prmList.Add(prm);

        DoQueries.ExecuteSPNonQuery(strSQLName, prmList);
    }

}
//**************Class  Worker - end **********************

