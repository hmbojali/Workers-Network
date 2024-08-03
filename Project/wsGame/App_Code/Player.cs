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

/// <summary>
/// Summary description for Player
/// </summary>
//**************Class  public class Player - begin ***************
public class Player
{
    //Encapsulation
    private int _PlayerID;
    private string _Email;
    private string _Username;
    private string _Password;
    private int _HighScore;
    private int _Attempts;
    //Properties
    public int PlayerID
    {
        get { return _PlayerID; }
        set { _PlayerID = value; }
    }
    public string Email
    {
        get { return _Email; }
        set { _Email = value; }
    }
    public string Username
    {
        get { return _Username; }
        set { _Username = value; }
    }
    public string Password
    {
        get { return _Password; }
        set { _Password = value; }
    }
    public int HighScore
    {
        get { return _HighScore; }
        set { _HighScore = value; }
    }
    public int Attempts
    {
        get { return _Attempts; }
        set { _Attempts = value; }
    }
    public Player()
    {
    }
}
//**************Class  Player - end   ***************