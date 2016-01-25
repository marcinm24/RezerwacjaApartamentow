using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;
using System.Web.Security;
using System.Data;

public partial class _Default : System.Web.UI.Page
{
    SqlConnection bazaAI = new SqlConnection("Data Source=SOLTYS-KOMPUTER\\SQLEXPRESS;Initial Catalog=StronaInternetowa;Integrated Security=True");
    protected void Page_Load(object sender, EventArgs e)
    {

    }

    protected void GridView1_SelectedIndexChanged(object sender, EventArgs e)
    {
        
    }
    protected void GridView1_RowCommand(object sender, GridViewCommandEventArgs e)
    {
        if (e.CommandName == "rezerwuj")
        {
            if (User.Identity.IsAuthenticated && User.IsInRole("Klient"))
            {
                               
                if (Czas_od.Text == "" || Czas_do.Text == "")
                {
                    ErrorLabel.Text = "Podaj termin rezerwacji !!";
                    ErrorLabel.Visible = true;
                }
                else
                {
                    
                    int index = Convert.ToInt32(e.CommandArgument);
                    GridViewRow row = GridView1.Rows[index];
                    string value = row.Cells[0].Text;  
                    TextBox11.Text = value;

                    
                    SqlCommand cmdR2 = new SqlCommand("SELECT * FROM Rezerwacja WHERE ID_Apartamentu='" + TextBox11.Text + "' AND (((Czas_od <= '" + Czas_od.Text + "' AND Czas_do >= '" + Czas_od.Text + "') OR (Czas_od <= '" + Czas_do.Text + "'  AND Czas_do >= '" + Czas_do.Text + "')) OR (Czas_od >='" + Czas_od.Text + "' AND Czas_do <= '" + Czas_do.Text + "' ))  ", bazaAI);
                    SqlDataReader drID;
                    bazaAI.Open();
                    drID = cmdR2.ExecuteReader();
                    drID.Read();

                    if (drID.HasRows)
                    {
                        ErrorData.Text = "Podana data rezerwacji jest zajęta !!";
                        ErrorData.Visible = true;
                        drID.Close();
                    }

                    else
                    {
                        Session["ID"] = User.Identity.Name;
                        drID.Close();
                        SqlCommand cmdR = new SqlCommand("insert into Rezerwacja(Czas_od,Czas_do,Status,ID_Klienta,ID_Apartamentu) values('" + Czas_od.Text + "','" + Czas_do.Text + "','oczekuje','" + Session["ID"].ToString() + "', '" + TextBox11.Text + "' )", bazaAI);
                        cmdR.ExecuteNonQuery();
                        Response.Redirect("About.aspx");
                    }

                    bazaAI.Close();
                }

            }
            else
            {
                Response.Redirect("Account/Login.aspx");

            }
        }
    }
}
