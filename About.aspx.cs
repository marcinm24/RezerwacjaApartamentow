using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;
using System.Web.Security;
using System.Data;


public partial class About : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        Session["Login"] = User.Identity.Name;

    }
    protected void KomentarzButton_Click(object sender, EventArgs e)
    {
        SqlConnection bazaAI = new SqlConnection("Data Source=SOLTYS-KOMPUTER\\SQLEXPRESS;Initial Catalog=StronaInternetowa;Integrated Security=True");
        SqlCommand cmd = new SqlCommand("SELECT [Komentarz] FROM [Rezerwacja] WHERE ID_Rezerwacji='" + IDRezerwacjiText.Text + "'", bazaAI);
        SqlCommand cmd1 = new SqlCommand("SELECT [Czas_do] FROM [Rezerwacja] WHERE ID_Rezerwacji='" + IDRezerwacjiText.Text + "'", bazaAI);
        SqlCommand cmd2 = new SqlCommand("UPDATE Rezerwacja SET Komentarz ='" + KomentarzText.Text + "' WHERE ID_Rezerwacji='" + IDRezerwacjiText.Text + "'", bazaAI);
        SqlDataReader drr;
        bazaAI.Open();
        drr = cmd.ExecuteReader();
        drr.Read();


        if (drr.IsDBNull(0))
        {
            drr.Close();
            DateTime time = DateTime.Now;
            drr = cmd1.ExecuteReader();
            drr.Read();
            DateTime d = drr.GetDateTime(0);

            if (time > d)
            {
                drr.Close();
                cmd2.ExecuteNonQuery();
                Page.Response.Redirect(HttpContext.Current.Request.Url.ToString(), true);
            }
            else
            {
                LabelIstniejeKomentarz.Text = "Komentarz możesz dodać w dniu zakończenia pobytu !!!";
                LabelIstniejeKomentarz.Visible = true;
            }
        }
        else
        {
            LabelIstniejeKomentarz.Text = "Dodałeś już jeden komentarz na temat pobytu !!!";
            LabelIstniejeKomentarz.Visible = true;


        }

        bazaAI.Close();
    }
}
