using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Security.Permissions;
public partial class wfGame : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {

        GameWS.WSGame game = new GameWS.WSGame();
        GameWS.Player player = new GameWS.Player();
        Customer customer = new Customer();
        CustomerDetails details = new CustomerDetails();
        details = customer.GetCustomerByID(Session["ID"].ToString());
        if (!game.ExistPlayer(details.Email))
        {
            player.Email = details.Email;
            player.Username = details.UserName;
            player.Password = details.Password;
            game.AddPlayer(player);
        }
        Session["PlayerID"] = game.GetPlayerByEmail(details.Email).PlayerID;

        player = game.GetPlayerByID(Session["PlayerID"].ToString());
        lblHighScore.Text = "High Score:" + player.HighScore;
        lblAttempts.Text = "Attempts:" + player.Attempts;
    }


    protected void btnCS_Click(object sender, EventArgs e)
    {
        GameWS.WSGame game = new GameWS.WSGame();
        GameWS.Player player = game.GetPlayerByID(Session["PlayerID"].ToString());
        if (player.HighScore < int.Parse(txtbxScoreVal.Text))
        {
            game.NewHighScore(int.Parse(txtbxScoreVal.Text), Session["PlayerID"].ToString());
        }
        game.SetAttempt(player);
        Response.Redirect("~/Game/wfGame.aspx");//to reload the page and show the updated data
    }

    protected void btnHomePage_Click(object sender, ImageClickEventArgs e)
    {
        Response.Redirect("/PagesForCustomers/wfHomePageCustomer.aspx");
    }
}