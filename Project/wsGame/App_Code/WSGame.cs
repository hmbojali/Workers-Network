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
/// Summary description for WSGame
/// </summary>
[WebService(Namespace = "http://tempuri.org/")]
[WebServiceBinding(ConformsTo = WsiProfiles.BasicProfile1_1)]
// To allow this Web Service to be called from script, using ASP.NET AJAX, uncomment the following line. 
// [System.Web.Script.Services.ScriptService]
public class WSGame : System.Web.Services.WebService
{

    public WSGame()
    {

        //Uncomment the following line if using designed components 
        //InitializeComponent(); 
    }



    //Encapsulation
    ArrayList prmList;
    OleDbParameter prm;
    string strSQLName;

    //___________________AddPlayer_______________________
    [WebMethod]
    public void AddPlayer(Player player)
    {
        strSQLName = "spAddPlayer";
        prmList = new ArrayList();

        prm = new OleDbParameter("@Email", OleDbType.VarChar);
        prm.Value = player.Email;
        prmList.Add(prm);

        prm = new OleDbParameter("@UserName", OleDbType.VarChar);
        prm.Value = player.Username;
        prmList.Add(prm);

        prm = new OleDbParameter("@Password", OleDbType.VarChar);
        prm.Value = player.Password;
        prmList.Add(prm);

        DoQueries.ExecuteSPNonQuery(strSQLName, prmList);
    }

    //___________________ExistPlayer_________________________________

    [WebMethod]
    public Boolean ExistPlayer(string Email)
    {
        strSQLName = "spExistPlayer";
        prmList = new ArrayList();

        prm = new OleDbParameter("@Email", OleDbType.VarChar);
        prm.Value = Email;
        prmList.Add(prm);

        int intCount = (int)DoQueries.ExecuteSPScalar(strSQLName, prmList);
        return intCount > 0;
    }

    [WebMethod]
    public void SetAttempt(Player player)
    {
        strSQLName = "spAddAttempt";
        prmList = new ArrayList();

        player.Attempts++;

        prm = new OleDbParameter("@Attempts", OleDbType.VarChar);
        prm.Value = player.Attempts;
        prmList.Add(prm);

        prm = new OleDbParameter("@PlayerID", OleDbType.VarChar);
        prm.Value = player.PlayerID;
        prmList.Add(prm);

        DoQueries.ExecuteSPNonQuery(strSQLName, prmList);
    }

    [WebMethod]
    public void NewHighScore(int score, string ID)
    {
        strSQLName = "spNewHighScore";
        prmList = new ArrayList();

        prm = new OleDbParameter("@HighScore", OleDbType.VarChar);
        prm.Value = score;
        prmList.Add(prm);

        prm = new OleDbParameter("@PlayerID", OleDbType.VarChar);
        prm.Value = ID;
        prmList.Add(prm);

        DoQueries.ExecuteSPNonQuery(strSQLName, prmList);
    }

    [WebMethod]
    public Player GetPlayerByEmail(string Email)
    {
        Player e = new Player();

        if (ExistPlayer(Email))
        {
            string strDetails =
                string.Format("SELECT * FROM tblPlayer" +
                " WHERE email='{0}'", Email);
            DataSet ds = DoQueries.ExecuteDataSet(strDetails);
            e.PlayerID = int.Parse(ds.Tables[0].Rows[0]["playerID"].ToString());
            e.Email = ds.Tables[0].Rows[0]["email"].ToString();
            e.Username = ds.Tables[0].Rows[0]["username"].ToString();
            e.Password = ds.Tables[0].Rows[0]["password"].ToString();
            e.HighScore = int.Parse(ds.Tables[0].Rows[0]["highScore"].ToString());
            e.Attempts = int.Parse(ds.Tables[0].Rows[0]["attempts"].ToString());
        }
        return e;
    }

    [WebMethod]
    public Player GetPlayerByID(string ID)
    {
        Player e = new Player();

        try
        {
            string strDetails =
                string.Format("SELECT * FROM tblPlayer" +
                " WHERE playerID={0}", ID);
            DataSet ds = DoQueries.ExecuteDataSet(strDetails);
            e.PlayerID = int.Parse(ds.Tables[0].Rows[0]["playerID"].ToString());
            e.Email = ds.Tables[0].Rows[0]["email"].ToString();
            e.Username = ds.Tables[0].Rows[0]["username"].ToString();
            e.Password = ds.Tables[0].Rows[0]["password"].ToString();
            e.HighScore = int.Parse(ds.Tables[0].Rows[0]["highScore"].ToString());
            e.Attempts = int.Parse(ds.Tables[0].Rows[0]["attempts"].ToString());
        }
        catch(Exception ex)
        {
            e.Email = ex.Message;
        }
        return e;
    }

}
