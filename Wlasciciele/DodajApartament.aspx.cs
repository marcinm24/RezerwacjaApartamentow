using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;
using System.Web.Security;
using System.Data;

public partial class DodajApartament : System.Web.UI.Page
{
    SqlConnection bazaAI = new SqlConnection("Data Source=SOLTYS-KOMPUTER\\SQLEXPRESS;Initial Catalog=StronaInternetowa;Integrated Security=True");
    protected void Page_Load(object sender, EventArgs e)
    {

    }
    protected void Button1_Click(object sender, EventArgs e)
    {
        Session["ID"]=User.Identity.Name;
        String query = "insert into Apartament(Opis,Lokalizacja,Adres,Ilość_miejsc,Login,Wyposazenie) values(@Opis,@Lokalizacja,@Adres,@Ilość_miejsc,@Login,@Wyposazenie)";
        SqlCommand cmd = new SqlCommand(query, bazaAI);
        cmd.Parameters.AddWithValue("@Opis",Opis.Text  );
        cmd.Parameters.AddWithValue("@Lokalizacja", Lokalizacja.Text);
        cmd.Parameters.AddWithValue("@Adres", Adres.Text);
        cmd.Parameters.AddWithValue("@Ilość_miejsc", IloscMiejsc.Text );
        cmd.Parameters.AddWithValue("@Login",Session["ID"] );
        cmd.Parameters.AddWithValue("@Wyposazenie",  Wyposazenie.Text );
        bazaAI.Open();
        cmd.ExecuteNonQuery();
        bazaAI.Close();
        Page.Response.Redirect(HttpContext.Current.Request.Url.ToString(), true);
        
    }
}